String? isEmpty(value) {
  if (value.isEmpty) {
    return "Please complete this field";
  } else {
    return null;
  }
}

String? isValidDay(value) {
  if (value.isEmpty || (0 == int.parse(value)) || (int.parse(value) > 31)) {
    return "";
  } else {
    return null;
  }
}

String? isValidMonth(value) {
  if (value.isEmpty || (0 == int.parse(value)) || (int.parse(value) > 12)) {
    return "";
  } else {
    return null;
  }
}

String? isValidYear(value) {
  if (value.isEmpty || value.length != 4) {
    return "";
  } else {
    return null;
  }
}

String? isValidHour(value) {
  if (value.isEmpty || int.parse(value) > 24 ||value.length != 2) {
    return "";
  } else {
    return null;
  }
}

String? isValidMin(value) {
  if (value.isEmpty || int.parse(value) > 59 || value.length != 2) {
    return "";
  } else {
    return null;
  }
}
