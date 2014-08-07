class Task < ActiveRecord::Base

  belongs_to :task_list

  validates :task_name, presence: true

end