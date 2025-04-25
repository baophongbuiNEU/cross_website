import 'package:jaspr_riverpod/jaspr_riverpod.dart';

enum SupportLanguage {
  en,
  vi,
  ja,
  ko,
}

final selectedLanguageProvider = StateProvider<String>((ref) => 'en');

class LanguageManager {
  static Map<String, dynamic> langAssets = {};

  // static const _languageKey = 'lang';

  // // Get client's language from browser
  // static String _getClientLanguage() {
  //   final browserLang = web.window.navigator.language.toLowerCase();
  //   // Map language to supported languages
  //   if (browserLang.startsWith('vi')) return 'vi';
  //   if (browserLang.startsWith('ja')) return 'ja';
  //   if (browserLang.startsWith('ko')) return 'ko';
  //   return 'en'; // Default to English
  // }

  // // Save language to cookie
  // static void saveLanguage(String langCode) {
  //   // Set cookie with 1-year expiration
  //   final expires = DateTime.now().add(Duration(days: 365)).toUtc();
  //   final cookie =
  //       '$_languageKey=$langCode; expires=${expires.toString()}; path=/';
  //   web.document.cookie = cookie;
  // }

  // // Retrieve language from cookie
  // static String? getStoredLanguage() {
  //   final cookies = web.document.cookie.split(';');
  //   for (var cookie in cookies) {
  //     final parts = cookie.trim().split('=');
  //     if (parts[0] == _languageKey && parts.length > 1) {
  //       return parts[1];
  //     }
  //   }
  //   return null;
  // }

  // // Initialize selectedLanguageProvider with cookie or client language
  // static final selectedLanguageProvider = StateProvider<String>((ref) {
  //   // Try to get language from cookie
  //   final storedLang = getStoredLanguage();
  //   if (storedLang != null && languages.containsKey(storedLang)) {
  //     return storedLang;
  //   }
  //   // Fallback to client language
  //   final clientLang = _getClientLanguage();
  //   return languages.containsKey(clientLang) ? clientLang : 'en';
  // });

  static Future<Map<String, dynamic>> loadAsset(String assetsPath) async {
    throw UnimplementedError('Handle later');
  }

  static final languages = {
    'en': 'English',
    'vi': 'Tiếng Việt',
    'ko': '한국어',
    'ja': '日本語',
  };

  static final Map<String, Map<String, String>> translations = {
    'header_about': {
      'en': 'About us',
      'vi': 'Về chúng tôi',
      'ko': '회사 소개',
      'ja': '会社概要',
    },
    'header_services': {
      'en': 'Services',
      'vi': 'Dịch vụ',
      'ko': '서비스',
      'ja': 'サービス',
    },
    'header_contact': {
      'en': 'Contact',
      'vi': 'Liên hệ',
      'ko': '연락처',
      'ja': 'お問い合わせ',
    },
    'header_careers': {
      'en': 'Careers',
      'vi': 'Tuyển dụng',
      'ko': '채용',
      'ja': '採用情報',
    },
    'header_home_page_title': {
      'en': 'Innovating the Future of Cross Tech',
      'vi': 'Đổi mới tương lai cùng Cross Tech',
      'ko': '크로스 테크의 미래 혁신',
      'ja': 'クロステックの未来を革新する',
    },
    'header_home_page_subtitle': {
      'en':
          'We empower businesses with cutting-edge solutions to thrive in a digital world.',
      'vi':
          'Chúng tôi trao quyền cho doanh nghiệp với các giải pháp tiên tiến để phát triển trong thế giới số.',
      'ko': '우리는 최첨단 솔루션으로 기업이 디지털 세계에서 번창할 수 있도록 지원합니다.',
      'ja': '私たちは最先端のソリューションで、企業がデジタル世界で繁栄する力を与えます。',
    },
    'header_home_page_button': {
      'en': 'Discover Our Solutions',
      'vi': 'Khám phá Giải pháp của Chúng tôi',
      'ko': '우리의 솔루션 알아보기',
      'ja': '私たちのソリューションをご覧ください',
    },
    'process_consultation_title': {
      'en': 'Consultation',
      'vi': 'Tư vấn',
      'ko': '상담',
      'ja': '相談',
    },
    'process_consultation_content': {
      'en':
          'During the initial consultation, we will discuss your business goals and objectives, target audience, and current marketing efforts. This will allow us to understand your needs and tailor our services to best fit your requirements.',
      'vi':
          'Trong buổi tư vấn ban đầu, chúng tôi sẽ thảo luận về mục tiêu kinh doanh, đối tượng mục tiêu và các nỗ lực tiếp thị hiện tại của bạn. Điều này giúp chúng tôi hiểu nhu cầu của bạn và điều chỉnh dịch vụ phù hợp nhất.',
      'ko':
          '최초 상담에서 귀사의 사업 목표와 목적, 타겟 고객, 현재 마케팅 노력을 논의합니다. 이를 통해 귀사의 필요를 이해하고 요구 사항에 가장 적합한 서비스를 맞춤화할 수 있습니다.',
      'ja':
          '初回相談では、お客様のビジネス目標と目的、ターゲットオーディエンス、現在のマーケティング活動について話し合います。これにより、お客様のニーズを理解し、最適なサービスを提供することができます。',
    },
    'process_research_title': {
      'en': 'Research and Strategy Development',
      'vi': 'Nghiên cứu và Phát triển Chiến lược',
      'ko': '연구 및 전략 개발',
      'ja': '調査と戦略開発',
    },
    'process_research_content': {
      'en':
          'We conduct in-depth research to develop a tailored strategy that aligns with your business goals and targets your audience effectively.',
      'vi':
          'Chúng tôi tiến hành nghiên cứu sâu để phát triển chiến lược phù hợp với mục tiêu kinh doanh và nhắm đúng đối tượng của bạn.',
      'ko': '우리는 귀사의 사업 목표와 타겟 고객에 효과적으로 맞춘 전략을 개발하기 위해 심층적인 조사를 진행합니다.',
      'ja':
          '私たちはお客様のビジネス目標に合わせ、ターゲットオーディエンスに効果的に対応するカスタマイズされた戦略を開発するために詳細な調査を行います。',
    },
    'process_implementation_title': {
      'en': 'Implementation',
      'vi': 'Triển khai',
      'ko': '구현',
      'ja': '実装',
    },
    'process_implementation_content': {
      'en':
          'Our team executes the strategy with precision, ensuring all elements are implemented to achieve optimal results.',
      'vi':
          'Đội ngũ của chúng tôi thực hiện chiến lược một cách chính xác, đảm bảo mọi yếu tố được triển khai để đạt kết quả tối ưu.',
      'ko': '우리 팀은 전략을 정밀하게 실행하여 모든 요소가 최적의 결과를 달성하도록 보장합니다.',
      'ja': '私たちのチームは戦略を正確に実行し、全ての要素が最適な結果を達成するよう保証します。',
    },
    'process_monitoring_title': {
      'en': 'Monitoring and Optimization',
      'vi': 'Giám sát và Tối ưu hóa',
      'ko': '모니터링 및 최적화',
      'ja': 'モニタリングと最適化',
    },
    'process_monitoring_content': {
      'en':
          'We continuously monitor performance and optimize strategies to ensure maximum effectiveness and ROI.',
      'vi':
          'Chúng tôi liên tục giám sát hiệu suất và tối ưu hóa chiến lược để đảm bảo hiệu quả tối đa và ROI.',
      'ko': '우리는 성과를 지속적으로 모니터링하고 전략을 최적화하여 최대 효율성과 ROI를 보장합니다.',
      'ja': 'パフォーマンスを継続的に監視し、戦略を最適化することで、最大の効果とROIを確保します。',
    },
    'process_reporting_title': {
      'en': 'Reporting and Communication',
      'vi': 'Báo cáo và Giao tiếp',
      'ko': '보고 및 소통',
      'ja': '報告とコミュニケーション',
    },
    'process_reporting_content': {
      'en':
          'Regular reports and open communication keep you informed about progress and results.',
      'vi':
          'Báo cáo thường xuyên và giao tiếp cởi mở giúp bạn nắm rõ tiến độ và kết quả.',
      'ko': '정기적인 보고와 열린 소통을 통해 진행 상황과 결과를 알려드립니다.',
      'ja': '定期的な報告とオープンなコミュニケーションを通じて、進捗と結果をお知らせします。',
    },
    'process_improvement_title': {
      'en': 'Continual Improvement',
      'vi': 'Cải thiện Liên tục',
      'ko': '지속적인 개선',
      'ja': '継続的改善',
    },
    'process_improvement_content': {
      'en':
          'We refine and improve strategies over time to keep your business ahead of the curve.',
      'vi':
          'Chúng tôi tinh chỉnh và cải thiện chiến lược theo thời gian để giữ cho doanh nghiệp của bạn luôn dẫn đầu.',
      'ko': '시간이 지나면서 전략을 세밀하게 조정하고 개선하여 귀사의 사업이 항상 앞서 나가도록 합니다.',
      'ja': '時間と共に戦略を洗練させ、改善することで、お客様のビジネスが常にリードし続けられるようにします。',
    },
    'our_service_seo_title': {
      'en': 'Search engine optimization',
      'vi': 'Tối ưu hóa công cụ tìm kiếm',
      'ko': '검색 엔진 최적화',
      'ja': '検索エンジン最適化',
    },
    'our_service_seo_content': {
      'en': 'Learn more',
      'vi': 'Tìm hiểu thêm',
      'ko': '더 알아보기',
      'ja': '詳細を見る',
    },
    'our_service_ppc_title': {
      'en': 'Pay-per-click advertising',
      'vi': 'Quảng cáo trả phí theo nhấp chuột',
      'ko': '클릭당 지불 광고',
      'ja': 'クリック課金型広告',
    },
    'our_service_ppc_content': {
      'en': 'Learn more',
      'vi': 'Tìm hiểu thêm',
      'ko': '더 알아보기',
      'ja': '詳細を見る',
    },
    'our_service_smm_title': {
      'en': 'Social Media Marketing',
      'vi': 'Tiếp thị mạng xã hội',
      'ko': '소셜 미디어 마케팅',
      'ja': 'ソーシャルメディアマーケティング',
    },
    'our_service_smm_content': {
      'en': 'Learn more',
      'vi': 'Tìm hiểu thêm',
      'ko': '더 알아보기',
      'ja': '詳細を見る',
    },
    'our_service_email_title': {
      'en': 'Email Marketing',
      'vi': 'Tiếp thị qua email',
      'ko': '이메일 마케팅',
      'ja': 'メールマーケティング',
    },
    'our_service_email_content': {
      'en': 'Learn more',
      'vi': 'Tìm hiểu thêm',
      'ko': '더 알아보기',
      'ja': '詳細を見る',
    },
    'our_service_content_title': {
      'en': 'Content Creation',
      'vi': 'Tạo nội dung',
      'ko': '콘텐츠 제작',
      'ja': 'コンテンツ作成',
    },
    'our_service_content_content': {
      'en': 'Learn more',
      'vi': 'Tìm hiểu thêm',
      'ko': '더 알아보기',
      'ja': '詳細を見る',
    },
    'our_service_analytics_title': {
      'en': 'Analytics and Tracking',
      'vi': 'Phân tích và Theo dõi',
      'ko': '분석 및 추적',
      'ja': '分析と追跡',
    },
    'our_service_analytics_content': {
      'en': 'Learn more',
      'vi': 'Tìm hiểu thêm',
      'ko': '더 알아보기',
      'ja': '詳細を見る',
    },
    'team_member1_name': {
      'en': 'John Smith',
      'vi': 'John Smith',
      'ko': 'John Smith',
      'ja': 'John Smith',
    },
    'team_member1_position': {
      'en': 'CEO and Founder',
      'vi': 'Giám đốc Điều hành và Nhà sáng lập',
      'ko': 'CEO 및 창립자',
      'ja': 'CEO兼創業者',
    },
    'team_member1_content': {
      'en':
          '10+ years of experience in digital marketing. Expertise in SEO, PPC, and content strategy',
      'vi':
          'Hơn 10 năm kinh nghiệm trong tiếp thị số. Chuyên môn về SEO, PPC và chiến lược nội dung',
      'ko': '디지털 마케팅에서 10년 이상의 경험. SEO, PPC 및 콘텐츠 전략 전문가',
      'ja': 'デジタルマーケティングで10年以上の経験。SEO、PPC、コンテンツ戦略の専門家',
    },
    'team_member2_name': {
      'en': 'Jane Doe',
      'vi': 'Jane Doe',
      'ko': 'Jane Doe',
      'ja': 'Jane Doe',
    },
    'team_member2_position': {
      'en': 'Chief Marketing Officer',
      'vi': 'Giám đốc Tiếp thị',
      'ko': '최고 마케팅 책임자',
      'ja': '最高マーケティング責任者',
    },
    'team_member2_content': {
      'en':
          'Expert in brand strategy and social media marketing with over 8 years of experience',
      'vi':
          'Chuyên gia về chiến lược thương hiệu và tiếp thị mạng xã hội với hơn 8 năm kinh nghiệm',
      'ko': '브랜드 전략 및 소셜 미디어 마케팅 전문가로 8년 이상의 경험 보유',
      'ja': 'ブランド戦略とソーシャルメディアマーケティングの専門家で、8年以上の経験',
    },
    'team_member3_name': {
      'en': 'Michael Brown',
      'vi': 'Michael Brown',
      'ko': 'Michael Brown',
      'ja': 'Michael Brown',
    },
    'team_member3_position': {
      'en': 'Lead Developer',
      'vi': 'Trưởng nhóm Phát triển',
      'ko': '리드 개발자',
      'ja': 'リード開発者',
    },
    'team_member3_content': {
      'en':
          'Specializes in web development and analytics with 12 years of experience',
      'vi': 'Chuyên về phát triển web và phân tích với 12 năm kinh nghiệm',
      'ko': '웹 개발 및 분석 전문가로 12년의 경험 보유',
      'ja': 'ウェブ開発と分析に特化し、12年の経験を持つ',
    },
    'team_member4_name': {
      'en': 'Emily White',
      'vi': 'Emily White',
      'ko': 'Emily White',
      'ja': 'Emily White',
    },
    'team_member4_position': {
      'en': 'Content Strategist',
      'vi': 'Chiến lược gia Nội dung',
      'ko': '콘텐츠 전략가',
      'ja': 'コンテンツストラテジスト',
    },
    'team_member4_content': {
      'en': 'Creative writer with 7 years of experience in content creation',
      'vi': 'Nhà văn sáng tạo với 7 năm kinh nghiệm trong tạo nội dung',
      'ko': '콘텐츠 제작에서 7년의 경험을 가진 창의적인 작가',
      'ja': 'コンテンツ作成で7年の経験を持つクリエイティブライター',
    },
    'team_member5_name': {
      'en': 'David Lee',
      'vi': 'David Lee',
      'ko': 'David Lee',
      'ja': 'David Lee',
    },
    'team_member5_position': {
      'en': 'PPC Specialist',
      'vi': 'Chuyên gia PPC',
      'ko': 'PPC 전문가',
      'ja': 'PPCスペシャリスト',
    },
    'team_member5_content': {
      'en':
          'Proven track record in managing pay-per-click campaigns for 9 years',
      'vi':
          'Thành tích nổi bật trong quản lý chiến dịch trả phí theo nhấp chuột suốt 9 năm',
      'ko': '9년 동안 클릭당 지불 캠페인 관리에서 입증된 실적 보유',
      'ja': '9年間のクリック課金キャンペーン管理で実績を証明',
    },
    'team_member6_name': {
      'en': 'Sarah Green',
      'vi': 'Sarah Green',
      'ko': 'Sarah Green',
      'ja': 'Sarah Green',
    },
    'team_member6_position': {
      'en': 'SEO Expert',
      'vi': 'Chuyên gia SEO',
      'ko': 'SEO 전문가',
      'ja': 'SEOエキスパート',
    },
    'team_member6_content': {
      'en': 'SEO guru with 10+ years optimizing websites for top rankings',
      'vi':
          'Bậc thầy SEO với hơn 10 năm tối ưu hóa website để đạt thứ hạng cao',
      'ko': '10년 이상 웹사이트를 최상위 랭킹으로 최적화한 SEO 전문가',
      'ja': '10年以上にわたりウェブサイトをトップランキングに最適化するSEOの達人',
    },
    'team_see_all_team': {
      'en': 'See all team',
      'vi': 'Xem toàn bộ đội ngũ',
      'ko': '전체 팀 보기',
      'ja': 'チーム全員を見る',
    },
    'footer_company_name': {
      'en': 'Positives',
      'vi': 'Positives',
      'ko': 'Positives',
      'ja': 'Positives',
    },
    'footer_about_us': {
      'en': 'About us',
      'vi': 'Về chúng tôi',
      'ko': '회사 소개',
      'ja': '会社概要',
    },
    'footer_services': {
      'en': 'Services',
      'vi': 'Dịch vụ',
      'ko': '서비스',
      'ja': 'サービス',
    },
    'footer_user_case': {
      'en': 'User Case',
      'vi': 'Trường hợp sử dụng',
      'ko': '사용 사례',
      'ja': 'ユースケース',
    },
    'footer_pricing': {
      'en': 'Pricing',
      'vi': 'Bảng giá',
      'ko': '가격',
      'ja': '料金',
    },
    'footer_contact_us': {
      'en': 'Contact us:',
      'vi': 'Liên hệ:',
      'ko': '연락처:',
      'ja': 'お問い合わせ:',
    },
    'footer_email_label': {
      'en': 'Email: info@crosstech.com',
      'vi': 'Email: info@crosstech.com',
      'ko': '이메일: info@crosstech.com',
      'ja': 'メール: info@crosstech.com',
    },
    'footer_phone_label': {
      'en': 'Phone: 0338305895',
      'vi': 'Điện thoại: 0338305895',
      'ko': '전화: 0338305895',
      'ja': '電話: 0338305895',
    },
    'footer_address_label': {
      'en':
          'Address: No. 24 - K7, Ciputra Urban Area, Phu Thuong Ward, Tay Ho District, Hanoi City, Vietnam',
      'vi':
          'Địa chỉ: Số 24 - K7, Khu đô thị Ciputra, Phường Phú Thượng, Quận Tây Hồ, Thành phố Hà Nội, Việt Nam',
      'ko': '주소: 베트남 하노이시 떠이호구 푸투옹동 시푸트라 도시구역 K7 24번지',
      'ja': '住所: ベトナム、ハノイ市タイホー区フートゥオン坊、シプトラ都市エリア K7-24番',
    },
    'footer_subscribe_to_news': {
      'en': 'Subscribe to news',
      'vi': 'Đăng ký nhận tin tức',
      'ko': '뉴스 구독',
      'ja': 'ニュースを購読',
    },
    'footer_copyright': {
      'en': '© 2024 Crosstech. All Rights Reserved.',
      'vi': '© 2024 Crosstech. Mọi quyền được bảo lưu.',
      'ko': '© 2024 Crosstech. 모든 권리 보유.',
      'ja': '© 2024 Crosstech. 全ての権利を保有。',
    },
    'footer_privacy_policy': {
      'en': 'Privacy Policy',
      'vi': 'Chính sách bảo mật',
      'ko': '개인정보 보호정책',
      'ja': 'プライバシーポリシー',
    },
    'cta_title': {
      'en': 'Let’s make things happen',
      'vi': 'Hãy cùng tạo nên điều kỳ diệu',
      'ko': '함께 변화를 만들어 갑시다',
      'ja': '一緒に未来を創りましょう',
    },
    'cta_description': {
      'en':
          'Contact us today to learn more about how our digital marketing services can help your business grow and succeed online.',
      'vi':
          'Liên hệ với chúng tôi ngay hôm nay để tìm hiểu thêm về cách dịch vụ tiếp thị số của chúng tôi có thể giúp doanh nghiệp của bạn phát triển và thành công trực tuyến.',
      'ko':
          '오늘 저희에게 연락하여 디지털 마케팅 서비스가 귀사의 비즈니스 성장과 온라인 성공에 어떻게 도움이 될 수 있는지 자세히 알아보세요.',
      'ja':
          '今日、私たちに連絡して、デジタルマーケティングサービスがあなたのビジネスを成長させ、オンラインで成功させる方法について詳しく知ってください。',
    },
    'cta_button_text': {
      'en': 'Get your free proposal',
      'vi': 'Nhận đề xuất miễn phí của bạn',
      'ko': '무료 제안서 받기',
      'ja': '無料提案書を受け取る',
    },
    'contact_us_say_hi': {
      'en': 'Say Hi',
      'vi': 'Chào hỏi',
      'ko': '인사하기',
      'ja': '挨拶する',
    },
    'contact_us_get_a_quote': {
      'en': 'Get a Quote',
      'vi': 'Nhận báo giá',
      'ko': '견적 받기',
      'ja': '見積もりを取得',
    },
    'contact_us_name_label': {
      'en': 'Name',
      'vi': 'Tên',
      'ko': '이름',
      'ja': '名前',
    },
    'contact_us_email_label': {
      'en': 'Email',
      'vi': 'Email',
      'ko': '이메일',
      'ja': 'メール',
    },
    'contact_us_message_label': {
      'en': 'Message*',
      'vi': 'Tin nhắn*',
      'ko': '메시지*',
      'ja': 'メッセージ*',
    },
    'case_studies_case1_content': {
      'en':
          'For a local restaurant, we implemented a targeted PPC campaign that resulted in a 50% increase in website traffic and a 25% increase in sales.',
      'vi':
          'Đối với một nhà hàng địa phương, chúng tôi đã triển khai chiến dịch PPC nhắm mục tiêu dẫn đến tăng 50% lưu lượng truy cập website và tăng 25% doanh số bán hàng.',
      'ko': '지역 레스토랑을 위해 타겟팅된 PPC 캠페인을 구현하여 웹사이트 트래픽이 50% 증가하고 매출이 25% 증가했습니다.',
      'ja':
          '地元のレストラン向けにターゲティングされたPPCキャンペーンを実施し、ウェブサイトのトラフィックが50%増加し、売上が25%増加しました。',
    },
    'case_studies_case2_content': {
      'en':
          'For a B2B software company, we developed an SEO strategy that resulted in a first page ranking for key keywords and a 200% increase in organic traffic.',
      'vi':
          'Đối với một công ty phần mềm B2B, chúng tôi đã phát triển chiến lược SEO giúp đạt thứ hạng trang đầu tiên cho các từ khóa chính và tăng 200% lưu lượng truy cập tự nhiên.',
      'ko':
          'B2B 소프트웨어 회사를 위해 SEO 전략을 개발하여 주요 키워드에 대해 첫 페이지 순위를 달성하고 유기적 트래픽이 200% 증가했습니다.',
      'ja':
          'B2Bソフトウェア企業向けにSEO戦略を開発し、主要キーワードで1ページ目のランキングを達成し、オーガニックトラフィックが200%増加しました。',
    },
    'case_studies_case3_content': {
      'en':
          'For a national retail chain, we created a social media marketing campaign that increased followers by 25% and generated a 20% increase in online sales.',
      'vi':
          'Đối với một chuỗi bán lẻ quốc gia, chúng tôi đã tạo ra chiến dịch tiếp thị mạng xã hội giúp tăng 25% người theo dõi và tạo ra mức tăng 20% doanh số bán hàng trực tuyến.',
      'ko':
          '전국 소매 체인을 위해 소셜 미디어 마케팅 캠페인을 만들어 팔로워가 25% 증가하고 온라인 매출이 20% 증가했습니다.',
      'ja':
          '全国小売チェーン向けにソーシャルメディアマーケティングキャンペーンを作成し、フォロワーが25%増加し、オンライン売上が20%増加しました。',
    },
    'case_studies_learn_more': {
      'en': 'Learn more',
      'vi': 'Tìm hiểu thêm',
      'ko': '더 알아보기',
      'ja': '詳細を見る',
    },
    'home_service_title': {
      'en': 'Service gg',
      'vi': 'Dịch vụ gg',
      'ko': '서비스 gg',
      'ja': 'サービス gg',
    },
    'home_service_content': {
      'en':
          'Explore Real-Life Examples of Our Proven Digital Marketing Success through Our Case Studies',
      'vi':
          'Khám phá các ví dụ thực tế về thành công tiếp thị số đã được chứng minh của chúng tôi qua các nghiên cứu điển hình',
      'ko': '우리의 입증된 디지털 마케팅 성공 사례를 사례 연구를 통해 살펴보세요',
      'ja': '私たちの実証済みのデジタルマーケティング成功事例をケーススタディで探求してください',
    },
    'home_case_studies_title': {
      'en': 'Case Studies',
      'vi': 'Nghiên cứu điển hình',
      'ko': '사례 연구',
      'ja': 'ケーススタディ',
    },
    'home_case_studies_content': {
      'en':
          'Explore Real-Life Examples of Our Proven Digital Marketing Success through Our Case Studies',
      'vi':
          'Khám phá các ví dụ thực tế về thành công tiếp thị số đã được chứng minh của chúng tôi qua các nghiên cứu điển hình',
      'ko': '우리의 입증된 디지털 마케팅 성공 사례를 사례 연구를 통해 살펴보세요',
      'ja': '私たちの実証済みのデジタルマーケティング成功事例をケーススタディで探求してください',
    },
    'home_process_title': {
      'en': 'Our Working Process',
      'vi': 'Quy trình làm việc của chúng tôi',
      'ko': '우리의 작업 프로세스',
      'ja': '私たちの作業プロセス',
    },
    'home_process_content': {
      'en': 'Step-by-Step Guide to Achieving Your Business Goals',
      'vi': 'Hướng dẫn từng bước để đạt được mục tiêu kinh doanh của bạn',
      'ko': '비즈니스 목표 달성을 위한 단계별 가이드',
      'ja': 'ビジネス目標を達成するためのステップごとのガイド',
    },
    'home_team_title': {
      'en': 'Team',
      'vi': 'Đội ngũ',
      'ko': '팀',
      'ja': 'チーム',
    },
    'home_team_content': {
      'en':
          'Meet the skilled and experienced team behind our successful digital marketing strategies',
      'vi':
          'Gặp gỡ đội ngũ tài năng và giàu kinh nghiệm đứng sau các chiến lược tiếp thị số thành công của chúng tôi',
      'ko': '우리의 성공적인 디지털 마케팅 전략을 뒷받침하는 숙련되고 경험이 풍부한 팀을 만나보세요',
      'ja': '私たちの成功したデジタルマーケティング戦略を支える熟練した経験豊富なチームにお会いください',
    },
    'home_contact_us_title': {
      'en': 'Contact Us',
      'vi': 'Liên hệ với chúng tôi',
      'ko': '연락처',
      'ja': 'お問い合わせ',
    },
    'home_contact_us_content': {
      'en': 'Connect with Us: Let\'s Discuss Your Digital Marketing Needs',
      'vi':
          'Kết nối với chúng tôi: Hãy cùng thảo luận về nhu cầu tiếp thị số của bạn',
      'ko': '저희와 연결하세요: 디지털 마케팅 요구 사항을 논의합시다',
      'ja': '私たちとつながりましょう：あなたのデジタルマーケティングニーズについて話し合いましょう',
    },
  };

  static String translate(String key, [String? langCode]) {
    final language = langCode ?? 'en';
    return translations[key]?[language] ?? 'Translation not found';
  }

  // static Component languageDropdown() {
  //   return Builder(builder: (context) sync* {
  //     final selectedLang = context.watch(selectedLanguageProvider);
  //     yield div(classes: "language-header", [
  //       select(
  //         styles: Styles(
  //           color: AppColors.textBlack,
  //           backgroundColor: AppColors.backgroundTheme,
  //         ),
  //         events: {
  //           'change': (dynamic event) {
  //             final value = event.target.value as String?;
  //             if (value != null) {
  //               context.read(selectedLanguageProvider.notifier).state = value;
  //             }
  //           }
  //         },
  //         [
  //           for (var lang in languages.entries)
  //             option(
  //               styles: Styles(
  //                 color: AppColors.textBlack,
  //               ),
  //               attributes: {
  //                 'value': lang.key,
  //                 if (lang.key == selectedLang) 'selected': ''
  //               },
  //               [text(lang.value)],
  //             ),
  //         ],
  //       ),
  //     ]);
  //   });
  // }

  // @css
  // static final styles = [
  //   css('.language-header', [
  //     css('&').styles(
  //       display: Display.flex,
  //       height: 48.px,
  //       padding: Padding.symmetric(horizontal: 15.px),
  //       border: Border(color: AppColors.textBlack, width: 1.px),
  //       radius: BorderRadius.circular(14.px),
  //       alignItems: AlignItems.center,
  //     ),
  //     css('select').styles(
  //       border: Border.none,
  //       cursor: Cursor.pointer,
  //       color: AppColors.textBlack,
  //       textAlign: TextAlign.center,
  //       fontFamily: FontFamily.list(
  //           [FontFamily("Space Grotesk"), FontFamilies.andaleMono]),
  //       fontSize: 18.px,
  //       fontWeight: FontWeight.w400,
  //       backgroundColor: Colors.transparent,
  //       raw: {'-webkit-appearance': 'none', '-moz-appearance': 'none'},
  //     ),
  //   ]),
  // ];
}
