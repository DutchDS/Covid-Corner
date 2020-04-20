select model, train_score, test_score from model_eval
where age = '60 - 69 years old' and gender = 'Male'
order by features desc

-- truncate table model_eval