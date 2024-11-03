class Regex {
  String validatePhoneViettel() {
    String regex = r"((^(\+84|0)8)6[0-9]{7}$)|((^(\+84|0)9)(6|7|8)[0-9]{7}$)|((^(\+84|0)3)(2|3|4|5|6|7|8|9)[0-9]{7}$)";
    return regex;
  }

  String validatePhoneVina() {
    String regex = r"((^(\+84|0)8)(1|2|3|4|5|7|8)[0-9]{7}$)|((^(\+84|0)9)(1|4)[0-9]{7}$)";
    return regex;
  }

  String validatePhoneMobi() {
    String regex = r"((^(\+84|0)8)9[0-9]{7}$)|((^(\+84|0)9)(0|3)[0-9]{7}$)|((^(\+84|0)7)(0|6|7|8|9)[0-9]{7}$)";
    return regex;
  }

  String validatePhoneVietnam() {
    String regex = r"((^(\+84|0)5)(2|3|4|5|6|7|8)[0-9]{7}$)|((^(\+84|0)9)2[0-9]{7}$)";
    return regex;
  }

  String validatePhoneGmobile() {
    String regex = r"((^(\+84|0)5)9[0-9]{7}$)|((^(\+84|0)9)9[0-9]{7}$)";
    return regex;
  }

  String validateMail() {
    String regex = r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    return regex;
  }

  String validatePassword() {
    String regex = r"^[A-Za-z0-9]\w{8,}$";
    return regex;
  }

  bool checkPhoneNumber(String phone) {
    RegExp regExpViettel = new RegExp(validatePhoneViettel());
    RegExp regExpVina = new RegExp(validatePhoneVina());
    RegExp regExpMobi = new RegExp(validatePhoneMobi());
    RegExp regExpVietnammobile = new RegExp(validatePhoneVietnam());
    RegExp regExpGmobile = new RegExp(validatePhoneGmobile());

    if (regExpViettel.hasMatch(phone)) return false;
    if (regExpVina.hasMatch(phone)) return false;
    if (regExpMobi.hasMatch(phone)) return false;
    if (regExpVietnammobile.hasMatch(phone)) return false;
    if (regExpGmobile.hasMatch(phone)) return false;

    return true;
  }

  bool checkEmail(String mail) {
    RegExp regExpMail = new RegExp(validateMail());

    if (regExpMail.hasMatch(mail)) return false;
    return true;
  }

  bool checkPassword(String password) {
    RegExp regExpPassword = new RegExp(validatePassword());

    if (regExpPassword.hasMatch(password)) return false;
    return true;
  }
}
