buzzwords = ['805室', '809室', '811室', '812室'] 
buzzword_counts = Hash.new({ value: 0 })
buzzword_count = [12.58,21.05,42.488,80.45]
i=0


SCHEDULER.every '2s' do
  random_buzzword = buzzwords[i]
  buzzword_counts[random_buzzword] = { label: random_buzzword, value: buzzword_count[i] }
  
  i = i+1;
 
  i = i%4 

  send_event('buzzwords', { items: buzzword_counts.values })
end
