actionstate {
  targets = {
    2,
    1,
    4,
    5,
    0,
    0
  },
  precis = 10,
  searches = {
    ["サーチ1"] = {
      0,
      0,
      100,
      100
    },
    ["サーチ2"] = {
      10,
      10,
      90,
      90
    }
  },
  chara = "ヒーロー",
  freq = 10,
  rates = {
    ["変数4"] = 40,
    ["変数3"] = 30,
    ["変数2"] = 20,
    ["変数1"] = 10
  },
  field = "あああ"
}

actionchain {
  {
    way = 0,
    cancel = {
      { 1, { "変数1", 100 } },
      { 2, { "変数1", 20 } },
      { 1, { "変数1" } },
      { 3, { "変数1" }, 100 },
      { 4, { "変数1", 200 } },
      { 1 }
    },
    move = { 10, 10 },
    next = 1,
    target = 0,
    hold = 20,
    search = "サーチ1",
    motion = "normal"
  },
  {
    way = 0,
    cancel = { },
    move = { 0, 0 },
    next = 2,
    target = 0,
    hold = 10,
    search = "サーチ1",
    motion = "jump_rise"
  },
  {
    cancel = { },
    search = "サーチ1",
    next = 1,
    target = -2,
    way = 2,
    motion = "normal"
  },
  name = "行動リスト1",
  cancel = {
    { 1, { "変数1" }, 10, 20 },
    { 1, { "変数2" } },
    { 2 },
    { 10 },
    { 7 },
    { 14, [3] = -1 },
    { 4, { "変数2" }, "normal" }
  }
}

exaction {
  action = {
    {
      {
        search = "サーチ1",
        target = 0,
        action = "行動リスト1",
        rate = { "変数1" },
        motion = "normal"
      },
      {
        cancel = 2,
        search = "サーチ1",
        target = 0,
        action = "行動リスト1",
        rate = { "変数1" },
        motion = "normal"
      },
      {
        cancel = 1,
        search = "サーチ1",
        target = 0,
        action = "行動リスト1",
        rate = { "変数1" },
        motion = "normal"
      },
      {
        cancel = 10,
        search = "サーチ1",
        target = 3,
        action = "行動リスト1",
        rate = { "変数2" },
        motion = "guard"
      },
      {
        target = 0,
        action = "行動リスト1",
        search = "サーチ1",
        motion = "normal"
      }
    },
    {
    }
  },
  condition = { 70, 50 },
  name = "ルーチン1"
}
