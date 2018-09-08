module ApplicantsHelper

  # 当前求职者名字
  def current_applicant_name
    current_applicant.email.split("@")[0]
  end

end
