//더미데이터
const List<Map<String, dynamic>> dummyDataPlugDetail = [
  {
    "plugId": 101,
    "topic": "plug_101",
    "plugName": "plug101",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 3, "minutes": 15},
    "usedPower": 400.0,
    "assignPower": 600.0,
    "plugDescription": "Near the entrance",
    "startTime": {"hours": 2, "minutes": 45},
    "realTimePower": 7.5
  },
  {
    "plugId": 202,
    "topic": "plug_202",
    "plugName": "plug202",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "Off",
    "runningTime": {"hours": 0, "minutes": 0},
    "usedPower": 0.0,
    "assignPower": 0.0,
    "plugDescription": "Next to the counter",
    "startTime": {"hours": 0, "minutes": 0},
    "realTimePower": 0.0
  },
  {
    "plugId": 303,
    "topic": "plug_303",
    "plugName": "plug303",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 1, "minutes": 45},
    "usedPower": 250.0,
    "assignPower": 400.0,
    "plugDescription": "By the window",
    "startTime": {"hours": 3, "minutes": 30},
    "realTimePower": 8.8
  },
  {
    "plugId": 404,
    "topic": "plug_404",
    "plugName": "plug404",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 0, "minutes": 50},
    "usedPower": 150.0,
    "assignPower": 900.0,
    "plugDescription": "Back corner",
    "startTime": {"hours": 0, "minutes": 0},
    "realTimePower": 1.2
  },
  {
    "plugId": 505,
    "topic": "plug_505",
    "plugName": "plug505",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "Off",
    "runningTime": {"hours": 0, "minutes": 0},
    "usedPower": 0.0,
    "assignPower": 0.0,
    "plugDescription": "Opposite the counter",
    "startTime": {"hours": 0, "minutes": 0},
    "realTimePower": 0.0
  },
  {
    "plugId": 606,
    "topic": "plug_606",
    "plugName": "plug606",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 3, "minutes": 5},
    "usedPower": 380.0,
    "assignPower": 450.0,
    "plugDescription": "By the door",
    "startTime": {"hours": 1, "minutes": 0},
    "realTimePower": 8.5
  },
  {
    "plugId": 707,
    "topic": "plug_707",
    "plugName": "plug707",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 1, "minutes": 30},
    "usedPower": 200.0,
    "assignPower": 300.0,
    "plugDescription": "By the wall",
    "startTime": {"hours": 0, "minutes": 45},
    "realTimePower": 8.0
  },
  {
    "plugId": 808,
    "topic": "plug_808",
    "plugName": "plug808",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "Off",
    "runningTime": {"hours": 1, "minutes": 15},
    "usedPower": 130.2,
    "assignPower": 300.0,
    "plugDescription": "Near the restroom",
    "startTime": {"hours": 3, "minutes": 15},
    "realTimePower": 0.0
  },
  {
    "plugId": 909,
    "topic": "plug_909",
    "plugName": "plug909",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 2, "minutes": 15},
    "usedPower": 350.0,
    "assignPower": 500.0,
    "plugDescription": "By the bookshelf",
    "startTime": {"hours": 1, "minutes": 15},
    "realTimePower": 9.5
  },
  {
    "plugId": 111,
    "topic": "plug_111",
    "plugName": "plug111",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "Off",
    "runningTime": {"hours": 0, "minutes": 0},
    "usedPower": 0.0,
    "assignPower": 0.0,
    "plugDescription": "In the middle",
    "startTime": {"hours": 0, "minutes": 0},
    "realTimePower": 0.0
  },
  {
    "plugId": 222,
    "topic": "plug_222",
    "plugName": "plug222",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 1, "minutes": 0},
    "usedPower": 250.0,
    "assignPower": 400.0,
    "plugDescription": "By the plant",
    "startTime": {"hours": 3, "minutes": 45},
    "realTimePower": 7.7
  },
  {
    "plugId": 333,
    "topic": "plug_333",
    "plugName": "plug333",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "Off",
    "runningTime": {"hours": 0, "minutes": 0},
    "usedPower": 0.0,
    "assignPower": 0.0,
    "plugDescription": "Near the outlet",
    "startTime": {"hours": 0, "minutes": 0},
    "realTimePower": 0.0
  }
];

//더미데이터
const List<Map<String, dynamic>> dummyDataChanged = [
  {
    "plugId": 101,
    "topic": "plug_101",
    "plugName": "plug101",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 4, "minutes": 32},
    "usedPower": 480.0,
    "assignPower": 600.0,
    "plugDescription": "Near the entrance",
    "startTime": {"hours": 2, "minutes": 45},
    "realTimePower": 7.5
  },
  {
    "plugId": 202,
    "topic": "plug_202",
    "plugName": "plug202",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "Off",
    "runningTime": {"hours": 0, "minutes": 0},
    "usedPower": 0.0,
    "assignPower": 0.0,
    "plugDescription": "Next to the counter",
    "startTime": {"hours": 0, "minutes": 0},
    "realTimePower": 0.0
  },
  {
    "plugId": 303,
    "topic": "plug_303",
    "plugName": "plug303",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 2, "minutes": 15},
    "usedPower": 320.0,
    "assignPower": 400.0,
    "plugDescription": "By the window",
    "startTime": {"hours": 3, "minutes": 30},
    "realTimePower": 8.8
  },
  {
    "plugId": 404,
    "topic": "plug_404",
    "plugName": "plug404",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 0, "minutes": 0},
    "usedPower": 300.0,
    "assignPower": 900.0,
    "plugDescription": "Back corner",
    "startTime": {"hours": 1, "minutes": 15},
    "realTimePower": 0.2
  },
  {
    "plugId": 505,
    "topic": "plug_505",
    "plugName": "plug505",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "Off",
    "runningTime": {"hours": 3, "minutes": 5},
    "usedPower": 380.0,
    "assignPower": 450.0,
    "plugDescription": "By the door",
    "startTime": {"hours": 1, "minutes": 0},
    "realTimePower": 8.5
  },
  {
    "plugId": 606,
    "topic": "plug_606",
    "plugName": "plug606",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 3, "minutes": 5},
    "usedPower": 380.0,
    "assignPower": 450.0,
    "plugDescription": "By the door",
    "startTime": {"hours": 1, "minutes": 0},
    "realTimePower": 8.5
  },
  {
    "plugId": 707,
    "topic": "plug_707",
    "plugName": "plug707",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 2, "minutes": 15},
    "usedPower": 270.0,
    "assignPower": 300.0,
    "plugDescription": "By the wall",
    "startTime": {"hours": 1, "minutes": 45},
    "realTimePower": 8.0
  },
  {
    "plugId": 808,
    "topic": "plug_808",
    "plugName": "plug808",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "Off",
    "runningTime": {"hours": 1, "minutes": 15},
    "usedPower": 130.2,
    "assignPower": 300.0,
    "plugDescription": "Near the restroom",
    "startTime": {"hours": 3, "minutes": 15},
    "realTimePower": 0.0
  },
  {
    "plugId": 909,
    "topic": "plug_909",
    "plugName": "plug909",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 3, "minutes": 0},
    "usedPower": 430.0,
    "assignPower": 500.0,
    "plugDescription": "By the bookshelf",
    "startTime": {"hours": 1, "minutes": 15},
    "realTimePower": 9.5
  },
  {
    "plugId": 111,
    "topic": "plug_111",
    "plugName": "plug111",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "Off",
    "runningTime": {"hours": 0, "minutes": 0},
    "usedPower": 0.0,
    "assignPower": 0.0,
    "plugDescription": "In the middle",
    "startTime": {"hours": 0, "minutes": 0},
    "realTimePower": 0.0
  },
  {
    "plugId": 222,
    "topic": "plug_222",
    "plugName": "plug222",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "On",
    "runningTime": {"hours": 1, "minutes": 30},
    "usedPower": 290.0,
    "assignPower": 400.0,
    "plugDescription": "By the plant",
    "startTime": {"hours": 3, "minutes": 45},
    "realTimePower": 7.7
  },
  {
    "plugId": 333,
    "topic": "plug_333",
    "plugName": "plug333",
    "userId": 1,
    "cafeId": 1,
    "subGroup": "group",
    "onOff": "Off",
    "runningTime": {"hours": 0, "minutes": 0},
    "usedPower": 0.0,
    "assignPower": 0.0,
    "plugDescription": "Near the outlet",
    "startTime": {"hours": 0, "minutes": 0},
    "realTimePower": 0.0
  }
];

//더미데이터
const List<Map<String, dynamic>> dummyDataAlerts = [
  {
    "plugId": 101,
    "plugName": "Plug101",
    "blockingTime": {
      "date": {"year": 2023, "month": 11, "day": 26},
      "time": {"hours": 20, "minutes": 31},
    },
    "check": false
  },
  {
    "plugId": 202,
    "plugName": "Plug202",
    "blockingTime": {
      "date": {"year": 2023, "month": 11, "day": 25},
      "time": {"hours": 18, "minutes": 45}
    },
    "check": true
  },
  {
    "plugId": 303,
    "plugName": "Plug303",
    "blockingTime": {
      "date": {"year": 2023, "month": 11, "day": 24},
      "time": {"hours": 16, "minutes": 12}
    },
    "check": false
  },
  {
    "plugId": 404,
    "plugName": "Plug404",
    "blockingTime": {
      "date": {"year": 2023, "month": 11, "day": 23},
      "time": {"hours": 14, "minutes": 28}
    },
    "check": true
  },
  {
    "plugId": 505,
    "plugName": "Plug505",
    "blockingTime": {
      "date": {"year": 2023, "month": 11, "day": 22},
      "time": {"hours": 12, "minutes": 54}
    },
    "check": false
  },
  {
    "plugId": 606,
    "plugName": "Plug606",
    "blockingTime": {
      "date": {"year": 2023, "month": 11, "day": 21},
      "time": {"hours": 11, "minutes": 10}
    },
    "check": true
  },
  {
    "plugId": 707,
    "plugName": "Plug707",
    "blockingTime": {
      "date": {"year": 2023, "month": 11, "day": 20},
      "time": {"hours": 9, "minutes": 26}
    },
    "check": false
  },
  {
    "plugId": 808,
    "plugName": "Plug808",
    "blockingTime": {
      "date": {"year": 2023, "month": 11, "day": 19},
      "time": {"hours": 7, "minutes": 42}
    },
    "check": true
  },
];

const List<double> dummyDataWeeklyPowerData = [
  70.0,
  60.0,
  120.0,
  150.6,
  200.7,
  70.4,
  80.7
];
