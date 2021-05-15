# frozen_string_literal: true

User.create!(
  [
    { email: 'admin@gmail.com', password: '123123', role: 'admin', first_name: 'Mario', last_name: 'Augusto' },
    { email: 'user2@gmail.com', password: '123123', role: 'student', first_name: 'Filippo', last_name: 'Brettas' },
    { email: 'user1@gmail.com', password: '123123', role: 'student', first_name: 'Rasmus', last_name: 'Arousell' },
    { email: 'user3@gmail.com', password: '123123', role: 'student', first_name: 'Ole', last_name: 'Johnny' }
  ]
)
Score.create!(
  [
    { user_id: 2, started_playing: DateTime.current, time_spent: '00:25:00', score_value: 10 },
    { user_id: 2, started_playing: DateTime.current, time_spent: '00:15:00', score_value: 15 },
    { user_id: 2, started_playing: DateTime.current, time_spent: '00:35:00', score_value: 22 },
    { user_id: 2, started_playing: DateTime.current, time_spent: '00:15:00', score_value: 10 },
    { user_id: 3, started_playing: DateTime.current, time_spent: '00:15:00', score_value: 12 },
    { user_id: 3, started_playing: DateTime.current, time_spent: '00:10:00', score_value: 11 },
    { user_id: 3, started_playing: DateTime.current, time_spent: '00:20:00', score_value: 17 },
    { user_id: 3, started_playing: DateTime.current, time_spent: '00:10:00', score_value: 11 },
    { user_id: 4, started_playing: DateTime.current, time_spent: '00:22:00', score_value: 21 },
    { user_id: 4, started_playing: DateTime.current, time_spent: '00:32:00', score_value: 12 },
    { user_id: 4, started_playing: DateTime.current, time_spent: '00:11:00', score_value: 13 },
    { user_id: 4, started_playing: DateTime.current, time_spent: '00:10:00', score_value: 16 }
  ]
)
