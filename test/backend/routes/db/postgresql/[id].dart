import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:postgres/postgres.dart';

Future<Response> onRequest(
  RequestContext context,
  String id,
) async {
  return switch (context.request.method) {
    HttpMethod.get => _getListbyId(context, id),
    HttpMethod.patch => _updateList(context, id),
    HttpMethod.delete => _deleteList(context, id),
    _ => Future.value(Response(statusCode: HttpStatus.methodNotAllowed))
  };
}

Future<Response> _getListbyId(RequestContext context, String id) async {
  final lists = <Map<String, dynamic>>[];
  final results = await context
      .read<PostgreSQLConnection>()
      .query('SELECT id, name FROM lists WHERE id = @$id;');

  for (final row in results) {
    lists.add({'id': row[0], 'name': row[1]});
  }

  return Response.json(body: lists);
}

Future<Response> _updateList(RequestContext context, String id) async {
  final body = await context.request.json() as Map<String, dynamic>;
  final name = body['name'] as String?;

  if (name != null) {
    try {
      final result = await context.read<PostgreSQLConnection>().query(
            'UPDATE lists SET name = ' "'" +
                name +
                " ' " +
                'WHERE id = ' +
                " '" +
                id +
                " '",
          );

      if (result.affectedRowCount == 1) {
        return Response.json(body: {'success': true});
      } else {
        return Response.json(body: {'success': false});
      }
    } catch (e) {
      return Response(statusCode: HttpStatus.connectionClosedWithoutResponse);
    }
  } else {
    return Response(statusCode: HttpStatus.badRequest);
  }
}

Future<Response> _deleteList(RequestContext context, String id) async {
  await context
      .read<PostgreSQLConnection>()
      .query('DELETE FROM lists WHERE id = ' " '" + id + " '")
      .then(
    (value) {
      return Response(statusCode: HttpStatus.noContent);
    },
    onError: (e) {
      return Response(statusCode: HttpStatus.badRequest);
    },
  );
  return Response(statusCode: HttpStatus.badRequest);
}
