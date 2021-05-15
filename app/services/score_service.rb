# frozen_string_literal: true

class ScoreService
  class << self
    include ScoreConstants

    def week_number(week_num)
      year = Time.now.year
      week_start = Date.commercial(year, week_num, FIRST_WEEK_DAY)
      week_end = Date.commercial(year, week_num, LAST_WEEK_DAY)
      [week_start, week_end]
    end

    def score_by_period(period)
      first_day = period.first
      last_day = period.last

      User.not_admin.scores_by_period first_day, last_day
    end

    def best_worst_rated_user
      User.not_admin.first_score_list + User.not_admin.last_score_list
    end
  end
end
