stash = {
  actionstate = {},
  actionchains = {},
  exaction = {}
}

function actionstate(args)
  stash['actionstate'] = args
end

function actionchain(args)
  table.insert(stash['actionchains'], args)
end

function exaction(args)
  stash['exaction'] = args
end
