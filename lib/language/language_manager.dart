import 'package:jaspr/jaspr.dart';

class LanguageManager {
  static final ValueNotifier<String> selectedLanguage = ValueNotifier('en');

  static final languages = {
    'en': 'English',
    'vi': 'Tiếng Việt',
    'ko': '한국어',
    'ja': '日本語',
  };

  static final translations = {
    'header': {
      'en': {
        'about': 'About us',
        'services': 'Services',
        'contact': 'Contact',
        'careers': 'Careers',
      },
      'vi': {
        'about': 'Về chúng tôi',
        'services': 'Dịch vụ',
        'contact': 'Liên hệ',
        'careers': 'Tuyển dụng',
      },
      'ko': {
        'about': '회사 소개',
        'services': '서비스',
        'contact': '연락처',
        'careers': '채용',
      },
      'ja': {
        'about': '会社概要',
        'services': 'サービス',
        'contact': 'お問い合わせ',
        'careers': '採用情報',
      },
    },
    'headerHomePage': {
      'en': {
        'title': 'Innovating the Future of Cross Tech',
        'subtitle':
            'We empower businesses with cutting-edge solutions to thrive in a digital world.',
        'button': 'Discover Our Solutions',
      },
      'vi': {
        'title': 'Đổi mới tương lai cùng Cross Tech',
        'subtitle':
            'Chúng tôi trao quyền cho doanh nghiệp với các giải pháp tiên tiến để phát triển trong thế giới số.',
        'button': 'Khám phá Giải pháp của Chúng tôi',
      },
      'ko': {
        'title': '크로스 테크의 미래 혁신',
        'subtitle': '우리는 최첨단 솔루션으로 기업이 디지털 세계에서 번창할 수 있도록 지원합니다.',
        'button': '우리의 솔루션 알아보기',
      },
      'ja': {
        'title': 'クロステックの未来を革新する',
        'subtitle': '私たちは最先端のソリューションで、企業がデジタル世界で繁栄する力を与えます。',
        'button': '私たちのソリューションをご覧ください',
      },
    },
    'process_block': {
      'en': {
        'consultation_title': 'Consultation',
        'consultation_content':
            'During the initial consultation, we will discuss your business goals and objectives, target audience, and current marketing efforts. This will allow us to understand your needs and tailor our services to best fit your requirements.',
        'research_title': 'Research and Strategy Development',
        'research_content':
            'We conduct in-depth research to develop a tailored strategy that aligns with your business goals and targets your audience effectively.',
        'implementation_title': 'Implementation',
        'implementation_content':
            'Our team executes the strategy with precision, ensuring all elements are implemented to achieve optimal results.',
        'monitoring_title': 'Monitoring and Optimization',
        'monitoring_content':
            'We continuously monitor performance and optimize strategies to ensure maximum effectiveness and ROI.',
        'reporting_title': 'Reporting and Communication',
        'reporting_content':
            'Regular reports and open communication keep you informed about progress and results.',
        'improvement_title': 'Continual Improvement',
        'improvement_content':
            'We refine and improve strategies over time to keep your business ahead of the curve.',
      },
      'vi': {
        'consultation_title': 'Tư vấn',
        'consultation_content':
            'Trong buổi tư vấn ban đầu, chúng tôi sẽ thảo luận về mục tiêu kinh doanh, đối tượng mục tiêu và các nỗ lực tiếp thị hiện tại của bạn. Điều này giúp chúng tôi hiểu nhu cầu của bạn và điều chỉnh dịch vụ phù hợp nhất.',
        'research_title': 'Nghiên cứu và Phát triển Chiến lược',
        'research_content':
            'Chúng tôi tiến hành nghiên cứu sâu để phát triển chiến lược phù hợp với mục tiêu kinh doanh và nhắm đúng đối tượng của bạn.',
        'implementation_title': 'Triển khai',
        'implementation_content':
            'Đội ngũ của chúng tôi thực hiện chiến lược một cách chính xác, đảm bảo mọi yếu tố được triển khai để đạt kết quả tối ưu.',
        'monitoring_title': 'Giám sát và Tối ưu hóa',
        'monitoring_content':
            'Chúng tôi liên tục giám sát hiệu suất và tối ưu hóa chiến lược để đảm bảo hiệu quả tối đa và ROI.',
        'reporting_title': 'Báo cáo và Giao tiếp',
        'reporting_content':
            'Báo cáo thường xuyên và giao tiếp cởi mở giúp bạn nắm rõ tiến độ và kết quả.',
        'improvement_title': 'Cải thiện Liên tục',
        'improvement_content':
            'Chúng tôi tinh chỉnh và cải thiện chiến lược theo thời gian để giữ cho doanh nghiệp của bạn luôn dẫn đầu.',
      },
      'ko': {
        'consultation_title': '상담',
        'consultation_content':
            '최초 상담에서 귀사의 사업 목표와 목적, 타겟 고객, 현재 마케팅 노력을 논의합니다. 이를 통해 귀사의 필요를 이해하고 요구 사항에 가장 적합한 서비스를 맞춤화할 수 있습니다.',
        'research_title': '연구 및 전략 개발',
        'research_content':
            '우리는 귀사의 사업 목표와 타겟 고객에 효과적으로 맞춘 전략을 개발하기 위해 심층적인 조사를 진행합니다.',
        'implementation_title': '구현',
        'implementation_content':
            '우리 팀은 전략을 정밀하게 실행하여 모든 요소가 최적의 결과를 달성하도록 보장합니다.',
        'monitoring_title': '모니터링 및 최적화',
        'monitoring_content':
            '우리는 성과를 지속적으로 모니터링하고 전략을 최적화하여 최대 효율성과 ROI를 보장합니다.',
        'reporting_title': '보고 및 소통',
        'reporting_content': '정기적인 보고와 열린 소통을 통해 진행 상황과 결과를 알려드립니다.',
        'improvement_title': '지속적인 개선',
        'improvement_content':
            '시간이 지나면서 전략을 세밀하게 조정하고 개선하여 귀사의 사업이 항상 앞서 나가도록 합니다.',
      },
      'ja': {
        'consultation_title': '相談',
        'consultation_content':
            '初回相談では、お客様のビジネス目標と目的、ターゲットオーディエンス、現在のマーケティング活動について話し合います。これにより、お客様のニーズを理解し、最適なサービスを提供することができます。',
        'research_title': '調査と戦略開発',
        'research_content':
            '私たちはお客様のビジネス目標に合わせ、ターゲットオーディエンスに効果的に対応するカスタマイズされた戦略を開発するために詳細な調査を行います。',
        'implementation_title': '実装',
        'implementation_content': '私たちのチームは戦略を正確に実行し、全ての要素が最適な結果を達成するよう保証します。',
        'monitoring_title': 'モニタリングと最適化',
        'monitoring_content': 'パフォーマンスを継続的に監視し、戦略を最適化することで、最大の効果とROIを確保します。',
        'reporting_title': '報告とコミュニケーション',
        'reporting_content': '定期的な報告とオープンなコミュニケーションを通じて、進捗と結果をお知らせします。',
        'improvement_title': '継続的改善',
        'improvement_content':
            '時間と共に戦略を洗練させ、改善することで、お客様のビジネスが常にリードし続けられるようにします。',
      },
    },
    'our_service': {
      'en': {
        'seo_title': 'Search engine optimization',
        'seo_content': 'Learn more',
        'ppc_title': 'Pay-per-click advertising',
        'ppc_content': 'Learn more',
        'smm_title': 'Social Media Marketing',
        'smm_content': 'Learn more',
        'email_title': 'Email Marketing',
        'email_content': 'Learn more',
        'content_title': 'Content Creation',
        'content_content': 'Learn more',
        'analytics_title': 'Analytics and Tracking',
        'analytics_content': 'Learn more',
      },
      'vi': {
        'seo_title': 'Tối ưu hóa công cụ tìm kiếm',
        'seo_content': 'Tìm hiểu thêm',
        'ppc_title': 'Quảng cáo trả phí theo nhấp chuột',
        'ppc_content': 'Tìm hiểu thêm',
        'smm_title': 'Tiếp thị mạng xã hội',
        'smm_content': 'Tìm hiểu thêm',
        'email_title': 'Tiếp thị qua email',
        'email_content': 'Tìm hiểu thêm',
        'content_title': 'Tạo nội dung',
        'content_content': 'Tìm hiểu thêm',
        'analytics_title': 'Phân tích và Theo dõi',
        'analytics_content': 'Tìm hiểu thêm',
      },
      'ko': {
        'seo_title': '검색 엔진 최적화',
        'seo_content': '더 알아보기',
        'ppc_title': '클릭당 지불 광고',
        'ppc_content': '더 알아보기',
        'smm_title': '소셜 미디어 마케팅',
        'smm_content': '더 알아보기',
        'email_title': '이메일 마케팅',
        'email_content': '더 알아보기',
        'content_title': '콘텐츠 제작',
        'content_content': '더 알아보기',
        'analytics_title': '분석 및 추적',
        'analytics_content': '더 알아보기',
      },
      'ja': {
        'seo_title': '検索エンジン最適化',
        'seo_content': '詳細を見る',
        'ppc_title': 'クリック課金型広告',
        'ppc_content': '詳細を見る',
        'smm_title': 'ソーシャルメディアマーケティング',
        'smm_content': '詳細を見る',
        'email_title': 'メールマーケティング',
        'email_content': '詳細を見る',
        'content_title': 'コンテンツ作成',
        'content_content': '詳細を見る',
        'analytics_title': '分析と追跡',
        'analytics_content': '詳細を見る',
      },
    },
    'group_of_card': {
      'en': {
        'member1_name': 'John Smith',
        'member1_position': 'CEO and Founder',
        'member1_content':
            '10+ years of experience in digital marketing. Expertise in SEO, PPC, and content strategy',
        'member2_name': 'Jane Doe',
        'member2_position': 'Chief Marketing Officer',
        'member2_content':
            'Expert in brand strategy and social media marketing with over 8 years of experience',
        'member3_name': 'Michael Brown',
        'member3_position': 'Lead Developer',
        'member3_content':
            'Specializes in web development and analytics with 12 years of experience',
        'member4_name': 'Emily White',
        'member4_position': 'Content Strategist',
        'member4_content':
            'Creative writer with 7 years of experience in content creation',
        'member5_name': 'David Lee',
        'member5_position': 'PPC Specialist',
        'member5_content':
            'Proven track record in managing pay-per-click campaigns for 9 years',
        'member6_name': 'Sarah Green',
        'member6_position': 'SEO Expert',
        'member6_content':
            'SEO guru with 10+ years optimizing websites for top rankings',
        'see_all_team': 'See all team',
      },
      'vi': {
        'member1_name': 'John Smith',
        'member1_position': 'Giám đốc Điều hành và Nhà sáng lập',
        'member1_content':
            'Hơn 10 năm kinh nghiệm trong tiếp thị số. Chuyên môn về SEO, PPC và chiến lược nội dung',
        'member2_name': 'Jane Doe',
        'member2_position': 'Giám đốc Tiếp thị',
        'member2_content':
            'Chuyên gia về chiến lược thương hiệu và tiếp thị mạng xã hội với hơn 8 năm kinh nghiệm',
        'member3_name': 'Michael Brown',
        'member3_position': 'Trưởng nhóm Phát triển',
        'member3_content':
            'Chuyên về phát triển web và phân tích với 12 năm kinh nghiệm',
        'member4_name': 'Emily White',
        'member4_position': 'Chiến lược gia Nội dung',
        'member4_content':
            'Nhà văn sáng tạo với 7 năm kinh nghiệm trong tạo nội dung',
        'member5_name': 'David Lee',
        'member5_position': 'Chuyên gia PPC',
        'member5_content':
            'Thành tích nổi bật trong quản lý chiến dịch trả phí theo nhấp chuột suốt 9 năm',
        'member6_name': 'Sarah Green',
        'member6_position': 'Chuyên gia SEO',
        'member6_content':
            'Bậc thầy SEO với hơn 10 năm tối ưu hóa website để đạt thứ hạng cao',
        'see_all_team': 'Xem toàn bộ đội ngũ',
      },
      'ko': {
        'member1_name': 'John Smith',
        'member1_position': 'CEO 및 창립자',
        'member1_content': '디지털 마케팅에서 10년 이상의 경험. SEO, PPC 및 콘텐츠 전략 전문가',
        'member2_name': 'Jane Doe',
        'member2_position': '최고 마케팅 책임자',
        'member2_content': '브랜드 전략 및 소셜 미디어 마케팅 전문가로 8년 이상의 경험 보유',
        'member3_name': 'Michael Brown',
        'member3_position': '리드 개발자',
        'member3_content': '웹 개발 및 분석 전문가로 12년의 경험 보유',
        'member4_name': 'Emily White',
        'member4_position': '콘텐츠 전략가',
        'member4_content': '콘텐츠 제작에서 7년의 경험을 가진 창의적인 작가',
        'member5_name': 'David Lee',
        'member5_position': 'PPC 전문가',
        'member5_content': '9년 동안 클릭당 지불 캠페인 관리에서 입증된 실적 보유',
        'member6_name': 'Sarah Green',
        'member6_position': 'SEO 전문가',
        'member6_content': '10년 이상 웹사이트를 최상위 랭킹으로 최적화한 SEO 전문가',
        'see_all_team': '전체 팀 보기',
      },
      'ja': {
        'member1_name': 'John Smith',
        'member1_position': 'CEO兼創業者',
        'member1_content': 'デジタルマーケティングで10年以上の経験。SEO、PPC、コンテンツ戦略の専門家',
        'member2_name': 'Jane Doe',
        'member2_position': '最高マーケティング責任者',
        'member2_content': 'ブランド戦略とソーシャルメディアマーケティングの専門家で、8年以上の経験',
        'member3_name': 'Michael Brown',
        'member3_position': 'リード開発者',
        'member3_content': 'ウェブ開発と分析に特化し、12年の経験を持つ',
        'member4_name': 'Emily White',
        'member4_position': 'コンテンツストラテジスト',
        'member4_content': 'コンテンツ作成で7年の経験を持つクリエイティブライター',
        'member5_name': 'David Lee',
        'member5_position': 'PPCスペシャリスト',
        'member5_content': '9年間のクリック課金キャンペーン管理で実績を証明',
        'member6_name': 'Sarah Green',
        'member6_position': 'SEOエキスパート',
        'member6_content': '10年以上にわたりウェブサイトをトップランキングに最適化するSEOの達人',
        'see_all_team': 'チーム全員を見る',
      },
    },
    'footer_block': {
      'en': {
        'company_name': 'Positives',
        'about_us': 'About us',
        'services': 'Services',
        'user_case': 'User Case',
        'pricing': 'Pricing',
        'contact_us': 'Contact us:',
        'email_label': 'Email: info@crosstech.com',
        'phone_label': 'Phone: 0338305895',
        'address_label':
            'Address: No. 24 - K7, Ciputra Urban Area, Phu Thuong Ward, Tay Ho District, Hanoi City, Vietnam',
        'subscribe_to_news': 'Subscribe to news',
        'copyright': '© 2024 Crosstech. All Rights Reserved.',
        'privacy_policy': 'Privacy Policy',
      },
      'vi': {
        'company_name': 'Positives',
        'about_us': 'Về chúng tôi',
        'services': 'Dịch vụ',
        'user_case': 'Trường hợp sử dụng',
        'pricing': 'Bảng giá',
        'contact_us': 'Liên hệ với chúng tôi:',
        'email_label': 'Email: info@crosstech.com',
        'phone_label': 'Điện thoại: 0338305895',
        'address_label':
            'Địa chỉ: Số 24 - K7, Khu đô thị Ciputra, Phường Phú Thượng, Quận Tây Hồ, Thành phố Hà Nội, Việt Nam',
        'subscribe_to_news': 'Đăng ký nhận tin tức',
        'copyright': '© 2024 Crosstech. Mọi quyền được bảo lưu.',
        'privacy_policy': 'Chính sách bảo mật',
      },
      'ko': {
        'company_name': 'Positives',
        'about_us': '회사 소개',
        'services': '서비스',
        'user_case': '사용 사례',
        'pricing': '가격',
        'contact_us': '연락처:',
        'email_label': '이메일: info@crosstech.com',
        'phone_label': '전화: 0338305895',
        'address_label': '주소: 베트남 하노이시 떠이호구 푸투옹동 시푸트라 도시구역 K7 24번지',
        'subscribe_to_news': '뉴스 구독',
        'copyright': '© 2024 Crosstech. 모든 권리 보유.',
        'privacy_policy': '개인정보 보호정책',
      },
      'ja': {
        'company_name': 'Positives',
        'about_us': '会社概要',
        'services': 'サービス',
        'user_case': 'ユースケース',
        'pricing': '料金',
        'contact_us': 'お問い合わせ:',
        'email_label': 'メール: info@crosstech.com',
        'phone_label': '電話: 0338305895',
        'address_label': '住所: ベトナム、ハノイ市タイホー区フートゥオン坊、シプトラ都市エリア K7-24番',
        'subscribe_to_news': 'ニュースを購読',
        'copyright': '© 2024 Crosstech. 全ての権利を保有。',
        'privacy_policy': 'プライバシーポリシー',
      },
    },
    'cta_block': {
      'en': {
        'title': 'Let’s make things happen',
        'description':
            'Contact us today to learn more about how our digital marketing services can help your business grow and succeed online.',
        'button_text': 'Get your free proposal',
      },
      'vi': {
        'title': 'Hãy cùng tạo nên điều kỳ diệu',
        'description':
            'Liên hệ với chúng tôi ngay hôm nay để tìm hiểu thêm về cách dịch vụ tiếp thị số của chúng tôi có thể giúp doanh nghiệp của bạn phát triển và thành công trực tuyến.',
        'button_text': 'Nhận đề xuất miễn phí của bạn',
      },
      'ko': {
        'title': '함께 변화를 만들어 갑시다',
        'description':
            '오늘 저희에게 연락하여 디지털 마케팅 서비스가 귀사의 비즈니스 성장과 온라인 성공에 어떻게 도움이 될 수 있는지 자세히 알아보세요.',
        'button_text': '무료 제안서 받기',
      },
      'ja': {
        'title': '一緒に未来を創りましょう',
        'description':
            '今日、私たちに連絡して、デジタルマーケティングサービスがあなたのビジネスを成長させ、オンラインで成功させる方法について詳しく知ってください。',
        'button_text': '無料提案書を受け取る',
      },
    },
    'contact_us_block': {
      'en': {
        'say_hi': 'Say Hi',
        'get_a_quote': 'Get a Quote',
        'name_label': 'Name',
        'email_label': 'Email',
        'message_label': 'Message*',
      },
      'vi': {
        'say_hi': 'Chào hỏi',
        'get_a_quote': 'Nhận báo giá',
        'name_label': 'Tên',
        'email_label': 'Email',
        'message_label': 'Tin nhắn*',
      },
      'ko': {
        'say_hi': '인사하기',
        'get_a_quote': '견적 받기',
        'name_label': '이름',
        'email_label': '이메일',
        'message_label': '메시지*',
      },
      'ja': {
        'say_hi': '挨拶する',
        'get_a_quote': '見積もりを取得',
        'name_label': '名前',
        'email_label': 'メール',
        'message_label': 'メッセージ*',
      },
    },
    'case_studies_block': {
      'en': {
        'case1_content':
            'For a local restaurant, we implemented a targeted PPC campaign that resulted in a 50% increase in website traffic and a 25% increase in sales.',
        'case2_content':
            'For a B2B software company, we developed an SEO strategy that resulted in a first page ranking for key keywords and a 200% increase in organic traffic.',
        'case3_content':
            'For a national retail chain, we created a social media marketing campaign that increased followers by 25% and generated a 20% increase in online sales.',
        'learn_more': 'Learn more',
      },
      'vi': {
        'case1_content':
            'Đối với một nhà hàng địa phương, chúng tôi đã triển khai chiến dịch PPC nhắm mục tiêu dẫn đến tăng 50% lưu lượng truy cập website và tăng 25% doanh số bán hàng.',
        'case2_content':
            'Đối với một công ty phần mềm B2B, chúng tôi đã phát triển chiến lược SEO giúp đạt thứ hạng trang đầu tiên cho các từ khóa chính và tăng 200% lưu lượng truy cập tự nhiên.',
        'case3_content':
            'Đối với một chuỗi bán lẻ quốc gia, chúng tôi đã tạo ra chiến dịch tiếp thị mạng xã hội giúp tăng 25% người theo dõi và tạo ra mức tăng 20% doanh số bán hàng trực tuyến.',
        'learn_more': 'Tìm hiểu thêm',
      },
      'ko': {
        'case1_content':
            '지역 레스토랑을 위해 타겟팅된 PPC 캠페인을 구현하여 웹사이트 트래픽이 50% 증가하고 매출이 25% 증가했습니다.',
        'case2_content':
            'B2B 소프트웨어 회사를 위해 SEO 전략을 개발하여 주요 키워드에 대해 첫 페이지 순위를 달성하고 유기적 트래픽이 200% 증가했습니다.',
        'case3_content':
            '전국 소매 체인을 위해 소셜 미디어 마케팅 캠페인을 만들어 팔로워가 25% 증가하고 온라인 매출이 20% 증가했습니다.',
        'learn_more': '더 알아보기',
      },
      'ja': {
        'case1_content':
            '地元のレストラン向けにターゲティングされたPPCキャンペーンを実施し、ウェブサイトのトラフィックが50%増加し、売上が25%増加しました。',
        'case2_content':
            'B2Bソフトウェア企業向けにSEO戦略を開発し、主要キーワードで1ページ目のランキングを達成し、オーガニックトラフィックが200%増加しました。',
        'case3_content':
            '全国小売チェーン向けにソーシャルメディアマーケティングキャンペーンを作成し、フォロワーが25%増加し、オンライン売上が20%増加しました。',
        'learn_more': '詳細を見る',
      },
    },
    'home_page': {
      'en': {
        'service_title': 'Service gg',
        'service_content':
            'Explore Real-Life Examples of Our Proven Digital Marketing Success through Our Case Studies',
        'case_studies_title': 'Case Studies',
        'case_studies_content':
            'Explore Real-Life Examples of Our Proven Digital Marketing Success through Our Case Studies',
        'process_title': 'Our Working Process',
        'process_content':
            'Step-by-Step Guide to Achieving Your Business Goals',
        'team_title': 'Team',
        'team_content':
            'Meet the skilled and experienced team behind our successful digital marketing strategies',
        'contact_us_title': 'Contact Us',
        'contact_us_content':
            '''Connect with Us: Let's Discuss Your Digital Marketing Needs''',
      },
      'vi': {
        'service_title': 'Dịch vụ gg',
        'service_content':
            'Khám phá các ví dụ thực tế về thành công tiếp thị số đã được chứng minh của chúng tôi qua các nghiên cứu điển hình',
        'case_studies_title': 'Nghiên cứu điển hình',
        'case_studies_content':
            'Khám phá các ví dụ thực tế về thành công tiếp thị số đã được chứng minh của chúng tôi qua các nghiên cứu điển hình',
        'process_title': 'Quy trình làm việc của chúng tôi',
        'process_content':
            'Hướng dẫn từng bước để đạt được mục tiêu kinh doanh của bạn',
        'team_title': 'Đội ngũ',
        'team_content':
            'Gặp gỡ đội ngũ tài năng và giàu kinh nghiệm đứng sau các chiến lược tiếp thị số thành công của chúng tôi',
        'contact_us_title': 'Liên hệ với chúng tôi',
        'contact_us_content':
            '''Kết nối với chúng tôi: Hãy cùng thảo luận về nhu cầu tiếp thị số của bạn''',
      },
      'ko': {
        'service_title': '서비스 gg',
        'service_content': '우리의 입증된 디지털 마케팅 성공 사례를 사례 연구를 통해 살펴보세요',
        'case_studies_title': '사례 연구',
        'case_studies_content': '우리의 입증된 디지털 마케팅 성공 사례를 사례 연구를 통해 살펴보세요',
        'process_title': '우리의 작업 프로세스',
        'process_content': '비즈니스 목표 달성을 위한 단계별 가이드',
        'team_title': '팀',
        'team_content': '우리의 성공적인 디지털 마케팅 전략을 뒷받침하는 숙련되고 경험이 풍부한 팀을 만나보세요',
        'contact_us_title': '연락처',
        'contact_us_content': '''저희와 연결하세요: 디지털 마케팅 요구 사항을 논의합시다''',
      },
      'ja': {
        'service_title': 'サービス gg',
        'service_content': '私たちの実証済みのデジタルマーケティング成功事例をケーススタディで探求してください',
        'case_studies_title': 'ケーススタディ',
        'case_studies_content': '私たちの実証済みのデジタルマーケティング成功事例をケーススタディで探求してください',
        'process_title': '私たちの作業プロセス',
        'process_content': 'ビジネス目標を達成するためのステップごとのガイド',
        'team_title': 'チーム',
        'team_content': '私たちの成功したデジタルマーケティング戦略を支える熟練した経験豊富なチームにお会いください',
        'contact_us_title': 'お問い合わせ',
        'contact_us_content': '''私たちとつながりましょう：あなたのデジタルマーケティングニーズについて話し合いましょう''',
      },
    },
  };

  static String getTranslation(String section, String key) {
    return translations[section]?[selectedLanguage.value]?[key] ??
        'Translation not found';
  }

  static Component languageDropdown() {
    return div(classes: "language-header", [
      select(
        events: {
          'change': (dynamic event) {
            final value = event.target.value as String?;
            if (value != null) {
              selectedLanguage.value = value;
            }
          }
        },
        [
          for (var lang in languages.entries)
            option(
              attributes: {
                'value': lang.key,
                if (lang.key == selectedLanguage.value) 'selected': ''
              },
              [text(lang.value)],
            ),
        ],
      ),
    ]);
  }

  @css
  static final styles = [
    css('.language-header', [
      css('&').styles(
        display: Display.flex,
        height: 48.px,
        padding: Padding.symmetric(horizontal: 15.px),
        border: Border.all(BorderSide(color: Colors.black, width: 1.px)),
        radius: BorderRadius.circular(14.px),
        alignItems: AlignItems.center,
      ),
      css('select').styles(
        border: Border.none,
        cursor: Cursor.pointer,
        color: Colors.black,
        textAlign: TextAlign.center,
        fontFamily: FontFamily.list(
            [FontFamily("Space Grotesk"), FontFamilies.andaleMono]),
        fontSize: 18.px,
        fontWeight: FontWeight.w400,
        backgroundColor: Colors.transparent,
        raw: {'-webkit-appearance': 'none', '-moz-appearance': 'none'},
      ),
    ]),
  ];
}
