import 'package:flutter_cache_manager/flutter_cache_manager.dart';

var cacheImageNetworkManager = CacheManager(
  Config(
    'cacheImageNetwork',
    stalePeriod: Duration(days: 5),
    maxNrOfCacheObjects: 500,
  ),
);

bool IS_BACK_UP = false;
bool IS_LOCK_ESSAY_QUESTION = false;
bool IS_LOCK_CREATE_FLASH_CARD = false;
bool IS_SHOW_PAYMENT = false;
bool IS_HIDDEN_REGISTER_ACCOUNT = false;
bool IS_ENABLE_GENDER = false;
bool IS_OPEN_HACK_LESSON = false;
bool IS_REQUIRED_PASSWORD_REGISTER = false;
bool IS_SHOW_SOCIAL_LOGIN = false;
int TIME_QUIZ_20 = 900;
int TIME_QUIZ_60 = 2700;
int TIME_QUIZ_PER_QUESTION_EXAM = 30;
int TIME_ESSAY_20 = 600;
int TIME_ESSAY_60 = 1800;
int TIME_ESSAY_PER_QUESTION_EXAM = 30;

const String PUBLIC = 'PUBLIC';
const String PRIVATE = 'PRIVATE';

const String MODE_DEMO = 'MODE_DEMO';
const String MODE_RELEASE = 'MODE_RELEASE';

const String ANDROID = 'android';
const String IOS = 'ios';

const int DEFAULT_TIME_QUIZ_FAST = 15;
const int DEFAULT_TIME_QUIZ_TEST = 45;
const int DEFAULT_TIME_ESSAY_FAST = 10;
const int DEFAULT_TIME_ESSAY_TEST = 30;
const bool DEFAULT_SHOW_TUTORIAL_NEW_FEATURE_BOTTOM_SHEET = false;
const int INFINITE_TIME = 1000000000;
const String INFINITE_TIME_TEXT = '∞';
const String BEARER = 'Bearer ';
const String AUTHORIZATION = 'Authorization';
const String X_DEVICE_INFO = 'X-DEVICE-INFO';
const String X_DEVICE_ID = 'X-DEVICE-ID';
const String X_DEVICE_PHYSICAL = 'X-DEVICE-PHYSICAL';
const String X_FCM_TOKEN = 'X_FCM_TOKEN';

// const Color DEFAULT_COLOR = Colors.grey;
// const Color CHOOSE_COLOR = Color(0xff8dd7f7);
// const Color FAILURE_COLOR = Color(0xffec5300);
// const Color SUCCESS_COLOR = Color(0xff00c800);

const String RANK_MONTHLY = 'MONTHLY';
const String RANK_DAILY = 'DAILY';
const String RANK_WEEKLY = 'WEEKLY';

const String MONTH_TIME = 'MONTH';
const String WEEK_TIME = 'WEEK';
const String DAY_TIME = 'DAY';
const String ALL_TIME = 'ALL';

const IDX_DEMO_HOME_MAIN_PAGE = 0;
const IDX_DEMO_HOME_FA_SHOP_PAGE = 1;
const IDX_DEMO_HOME_PROFILE_PAGE = 2;
const IDX_DEMO_HOME_PROFILE_LOGIN_PAGE = 0;
const IDX_DEMO_HOME_PROFILE_LOGIN_PHONE_PAGE = 1;
const IDX_DEMO_HOME_PROFILE_LOGIN_ACCOUNT_PAGE = 2;
const IDX_DEMO_HOME_PROFILE_REGISTER_PAGE = 3;

const IDX_RELEASE_HOME_MAIN_PAGE = 0;
// const IDX_RELEASE_HOME_RANK_PAGE = 1;
const IDX_RELEASE_HOME_FA_SHOP_PAGE = 1;
const IDX_RELEASE_HOME_PROFILE_PAGE = 2;
const IDX_RELEASE_HOME_FALINGO_PAGE = 1;

const POSITION_LEFT = "LEFT";
const POSITION_MID = "MID";
const POSITION_RIGHT = "RIGHT";

const CACHE_IMAGE_SUBJECT = 'IMAGE_SUBJECT';
const CACHE_IMAGE_AVATAR = 'IMAGE_AVATAR';

// const DEFAULT_IS_EXAM = false;
const DEFAULT_MODE_SCROLL_VERTICAL = false;
const DEFAULT_NUMBER_TRAM = 3;
const DEFAULT_NUMBER_QUESTION_IN_TRAM = 3;

const DEFATUL_MAX_QUIZ_EXAM = 200;

const PAYMENT_FA_PAY = 'FA_PAY';
const SERIVCE_TYPE = 'TRIAL';
const PAYMENT_SERVICE_FREE = 'FREE';
const PAYMENT_SERVICE_PRO = 'PRO';
const PAYMENT_REQUIRE = 'PAYMENT_REQUIRE';

Map<String, dynamic> deviceData = <String, dynamic>{};

const MESSAGE_FAQUIZ_REPORT = 'https://m.me/appfaquiz?ref=goi-full';


const COMMENT_MESSAGE_SUCCESS = [
  "Tuyệt cú mèo",
  "Giỏi ghê",
  "Mê chữ ê kéo dài",
  "Ỏ giỏi đấy",
  "Hảo hảo",
  "Dễ như ăn bánh",
  "Mấy câu này tuổi gì",
  "Ơ mây zing",
  "Phenomenal!!!",
  "Spectacular!!!",
  "Oăn đờ phu",
  "Really?",
  "Thật không thể tin được",
  "Có khiếu quá",
  "Nghệ cả củ",
  "Dăm ba cái câu hỏi",
  "Khéo quá",
  "Giỏi nha bây",
  "Ăn gì giỏi thế",
  "Chuẩn không cần chỉnh",
  "Good job!",
  "Congratulation!",
  "Marvelous!!!",
  "Fabulous!!!",
  "Bravo~",
  "I love you",
  "Giỏi!",
  "Tiếp tục nào!",
  "Chiến tích",
  "Bứt phá hơn đê",
  "Còn nhiều câu khó hơn cơ!",
  "Được quá nhỉ",
  "Có ai bảo bạn giỏi chưa?",
  "Hâm mộ ghê cơ",
  "Tiến thêm bước nữa nào!",
  "Não săn chắc phết nhể",
  "Mê rồi nha chế",
  "Bạn giỏi thật chứ đùa",
  "Quá giỏi",
  "Công nhận chiến tích",
  "Tuyệt quá",
  "Quá đã~",
  "Khen nhiều hơi mệt nha!",
  "MVP",
  "Victory",
  "Ngon lành!",
  "Nâng cấp TK thì khen tiếp",
  "Bro được đấy",
  "Ngon zai",
  "Mận ổi cóc xoài mía quá",
  "Nice job! I’m impressed!",
  "Stick with it",
  "Giỏi quá vỗ tay bép bép",
  "Gút chóp bạn hiền!!!!",
  "Mười điểm, làm tiếp!!!!",
  "Xuất sắc quá cơ!!!",
  "Gia đình tự hào về bạn!!",
  "Bạn xuất sắc hơn 90% người rồi đấy!",
  "Hảo!!!",
  "Tuyệt vời ông mặt trời!",
  "Đỉnh đỉnh!!",
  "Đỉnh của chópppp",
  "Xuất sắc luôn!!!!",
  "3 phần xuất sắc 7 phần như 3",
  "Âyya, lại trả lời chính xác rồi!!!",
  "Tổ quốc tin bạn, phát huy tiếp nàooo",
  "Không còn từ nào để khen nữa cơ!!",
  "Lại đỉnh rồiii!!!",
  "Bingo!!!",
  "Tuyệt!!!",
  "Chúc mừng!!! Lại đúng rồiiii!",
  "Chất lừ luôn",
  "Sao giỏi quá zậy?",
  "Quá là vip pro luôn bạn eiii",
  "Chất như nước cất",
  "Hết nước chấmmm",
  "Quá là xuất sắc",
  "Đỉnh của đỉnh",
  "Hay quá bạn ơi",
  "Xịn xò con bò luôn",
  "Rất chi là siêu cấp vũ trụ",
  "Học kiểu này ai theo kịp bạn",
  "Năng suất quá bạn ơii",
  "Này có nhằm nhò gì nhở?",
  "Chất hơn bạn ơi",
  "Sao giỏi quá đê",
  "Tuyêt vời ông mặt trời",
  "Xịn vậy luôn",
  "Đúng là học vì đam mê, giỏi quá!",
  "Hơn cả giỏi, bạn quá đỉnh",
  "Sự nỗ lực này xứng đáng được công nhận",
  "Cứ hơi bị xịn xò í nhở",
  "Giỏi vậy ai dám chê",
  "Tưởng giỏi ai dè giỏi thật",
  "Nhìn vậy mà cũng giỏi phết ha",
  "Sao nay giỏi vậy?",
  "Úi, một sinh viên chất lừ",
  "Well done!",
  "Ngưỡng mộ quá!!!",
  "Sao lại có người giỏi như vậy cơ!!!",
  "Xứng đáng có 10 người yêu!!!",
  "Học bổng trong tay rồi!!!",
  "Ngầu!!!",
  "Chất quá!!!",
  "Chất như nước cất luôn!!!",
  "Thành công không xa!!!",
  "Dáng vẻ này mình thích lắm",
  "Lắm khi thấy bạn đỉnh vậy",
  "Giỏi thật chứ đùa",
  "Không thể tin được",
  "Ấn tượng điểm số của bạn",
  "Wao, 1 vẻ đẹp tri thức",
  "Giỏi quá cơ",
  "Rất đáng để nể phục",
  "Không giỏi đời không nể",
  "Bạn giỏi hơn khối người rồi đó",
  "Duy trì phong độ này nhé",
  "Giỏi thế!",
  "Wao, sáng mắt luôn",
  "1 điểm số ấn tượng",
  "Chiến luôn",
  "Không gì làm khó được bạn",
  "Câu tiếp theo!!!"
];
const COMMENT_MESSAGE_FAILED = [
  "Cố chút xíu nữa nào!",
  "Suy nghĩ kĩ nhé",
  "Hơi sai tí thui!",
  "Thất bại là mẹ thất bại",
  "Defeat",
  "Hồi máu nhanh",
  "Quên không dùng não rồi",
  "Đừng vội vã",
  "Cẩn trọng hơn nhé",
  "Đừng bị mắc bẫy",
  "Suy luận tí đê",
  "Chọn bừa à?",
  "Ê bạn chán tôi rồi à?",
  "Làm đúng tui iu bạn luôn",
  "Đừng sai nữa em mệt rồi",
  "Alo sai dữ vậy cha nội",
  "Có muốn đi học nữa không?",
  "Học, học nữa, học lại",
  "Làm sai nữa tui buồn á",
  "Eo sai kìa",
  "Chê!",
  "N.G.U",
  "Ai cũng đều có sai lầm",
  "Never bend your head",
  "Hang tough!",
  "Hang in there!",
  "Gắng lên nào!",
  "Không phải lúc chơi đâu",
  "Khổ trước sướng sau",
  "Sai nhiều mới đúng được",
  "Do the best you can",
  "Cố hết sức chưa đấy!",
  "Hơi hóc búa với bạn rùi",
  "Bước thêm bước nữa nào",
  "Đừng từ bỏ nhé!",
  "Luyện tập thêm nào",
  "It will be okay",
  "Bạn giỏi mà, cố lên!",
  "Come on, you can do it!",
  "Chán quá thì chat với tui",
  "Thử lại lần nữa xem",
  "Không khó lắm đâu, thề!",
  "Ai chả có sai lầm~",
  "Ai cũng sai câu này, đừng lo",
  "Tặng cái ôm động viên nè!",
  "Keep going",
  "Hói đầu chưa bây?",
  "Không dễ đâu cưng",
  "Nuốt không trôi",
  "Đừng dừng lại",
  "Tiếp tục đi nào",
  "Sắp giỏi dồi",
  "Quiz tôi xin chửi vào mặt bạn",
  "Bạn tệ :))",
  "0 điểm về chỗ!!!",
  "Câu dễ thế cơ mà, chê!!!",
  "Quiz từ chối nhận người quen:)",
  "Không sao, cố thêm lần nữa !!",
  "Chê :))))",
  "Lại sai cơ!!.",
  "Quiz cạn ngôn :)",
  "Còn sai nữa là xuống đáy BXH rồi!!!",
  "Đúng hộ Quiz 1 nữa câu thôi nào!!",
  "10 phần bất an về điểm thi của bạn!!",
  "Âyya, biết ngay lại sai mà!!!",
  "Vẫn chưa đến nổi tuyệt vọng!!!",
  "Không còn gì để chê :))",
  "Vẫn chưa đến nổi phải tuyệt vọng!!!",
  "Cố lên rồi sẽ sai tiếp!!!",
  "Ngáo àaaa",
  "Chia buồn! Lại sai rồi!!",
  "sai câu nữa là còn đúng cái nịt",
  "U là trời, dễ thế mà sai à",
  "Làm sai lại đổ lỗi xu cà na chứ gì",
  "Sai thêm câu nữa là về chăn bò",
  "Gòi xong, phí tiền đi học",
  "Stupid như pò",
  "Chánnnn",
  "Nhục quá bạn đê!",
  "Sai quài vậy bạn",
  "Sai vừa thôi, để phần người khác với",
  "Đích còn dài mà cứ lẹt đẹt vậy luôn",
  "Học tài thi phận, lận đận thì thi lại đê",
  "Tầm này về quê nuôi cá là vừa",
  "Nào mới chịu thể hiện đây",
  "Sao nay tệ vậy?",
  "Haizzz, chả thèm care",
  "Học hành đàng hoàng cái coi",
  "Mất nửa cái linh hồn khi thấy điểm của bạn",
  "Xịn xò đành nhường cho người khác",
  "Chúc bạn may mắn lần sau",
  "Coi như lần này xui",
  "Lần này coi như nháp",
  "Nháp vừa vừa thuii",
  "Thui đừng nháp nữa",
  "Nữa, lại tệ nữa",
  "Được rồi, xin người làm đàng hoàng cái coi",
  "Học vậy mà tính đi ngủ luôn",
  "Thật là uổng công bame kì vọng :(",
  "Thất vọng quá đi!!!",
  "Xứng đáng Ế đến già!!!",
  "Qua môn còn xa quá!!!",
  "Sầu!!!!",
  "Chán thế!!!",
  "Úp mặt vào tường tự kiểm điểm đê!!",
  "Thất bại là mẹ thành công!!",
  "Đọc đề không vậy?",
  "Làm thàm đúng hem?",
  "Cẩn thận chút đi bạn",
  "10 điểm, nhưng 10 điểm cho người ta",
  "Nỗ lực thêm bạn ơi",
  "Học năng suất lên nào",
  "Đừng chỉ nói suông, hãy hành động đê",
  "Chịu luôn, rất tệ",
  "Lần sau phải bức phá hơn",
  "Lần sau hết mình nha",
  "Cần sự bức phá hơn ở bạn",
  "Nỗ lực thêm chút nào",
  "Đừng quá lo, lần sau bạn sẽ tốt hơn",
  "Thử sức thêm lần nữa nào",
  "Tệ quá nghe",
  "Khó chút đã lụi hẻ?",
  "Làm lại thôi chờ chi!!"
];
