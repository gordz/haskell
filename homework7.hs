expr = do {
  n <- natural
  ns <- many
  (do  {
    symbol "-"
    natural
  })
  return (foldl (-) n ns)
}

expr = do {
  n <- natural
  symbol "-"
  n' <- natural
  return (n - n')
}

expr = do {
  n <- natural
  ns <- many (do {
    symbol "-"
    natural
  })
}
	
expr = do {
  n <- natural
  symbol "-"
  e <- expr
  return (e - n)
}

