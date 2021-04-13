guest = ['Андрей  ', '  Влад', 'илья', '  кирилл  ']
guest[0] = guest[0].strip().lower().title()
guest[1] = guest[1].strip().lower().title()
guest[2] = guest[2].strip().lower().title()
guest[3] = guest[3].strip().lower().title()
print('Гости: ' + guest[0] +', '+ guest[1] +', '+ guest[2] + '\nУмер: ' + guest[3])
