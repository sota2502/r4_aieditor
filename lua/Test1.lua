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
    ["�T�[�`1"] = {
      0,
      0,
      100,
      100
    },
    ["�T�[�`2"] = {
      10,
      10,
      90,
      90
    }
  },
  chara = "�q�[���[",
  freq = 10,
  rates = {
    ["�ϐ�4"] = 40,
    ["�ϐ�3"] = 30,
    ["�ϐ�2"] = 20,
    ["�ϐ�1"] = 10
  },
  field = "������"
}

actionchain {
  {
    way = 0,
    cancel = {
      { 1, { "�ϐ�1", 100 } },
      { 2, { "�ϐ�1", 20 } },
      { 1, { "�ϐ�1" } },
      { 3, { "�ϐ�1" }, 100 },
      { 4, { "�ϐ�1", 200 } },
      { 1 }
    },
    move = { 10, 10 },
    next = 1,
    target = 0,
    hold = 20,
    search = "�T�[�`1",
    motion = "normal"
  },
  {
    way = 0,
    cancel = { },
    move = { 0, 0 },
    next = 2,
    target = 0,
    hold = 10,
    search = "�T�[�`1",
    motion = "jump_rise"
  },
  {
    cancel = { },
    search = "�T�[�`1",
    next = 1,
    target = -2,
    way = 2,
    motion = "normal"
  },
  name = "�s�����X�g1",
  cancel = {
    { 1, { "�ϐ�1" }, 10, 20 },
    { 1, { "�ϐ�2" } },
    { 2 },
    { 10 },
    { 7 },
    { 14, [3] = -1 },
    { 4, { "�ϐ�2" }, "normal" }
  }
}

exaction {
  action = {
    {
      {
        search = "�T�[�`1",
        target = 0,
        action = "�s�����X�g1",
        rate = { "�ϐ�1" },
        motion = "normal"
      },
      {
        cancel = 2,
        search = "�T�[�`1",
        target = 0,
        action = "�s�����X�g1",
        rate = { "�ϐ�1" },
        motion = "normal"
      },
      {
        cancel = 1,
        search = "�T�[�`1",
        target = 0,
        action = "�s�����X�g1",
        rate = { "�ϐ�1" },
        motion = "normal"
      },
      {
        cancel = 10,
        search = "�T�[�`1",
        target = 3,
        action = "�s�����X�g1",
        rate = { "�ϐ�2" },
        motion = "guard"
      },
      {
        target = 0,
        action = "�s�����X�g1",
        search = "�T�[�`1",
        motion = "normal"
      }
    },
    {
    }
  },
  condition = { 70, 50 },
  name = "���[�`��1"
}
