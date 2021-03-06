# frozen_string_literal: true

class Course
  attr_accessor :subject
  @@all = []
  def initialize(subject)
    @subject = subject
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_subject(subject)
    all.find do |course|
    course.subject == subject
    end
  end

  def enrollments
    Enrollment.all.select do |enrollment|
      enrollment.course == self
    end
  end

  def class_list
    enrollments.map do |enrollment|
      enrollment.student.full_name
    end
  end

  def all_subjects
    all.map(&subject).uniq
  end

end
