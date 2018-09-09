module ApplicantsHelper

  # 当前求职者名字
  def current_applicant_name
    current_applicant.email.split("@")[0]
  end

  # 性别选项数组
  def sex_select_arr
    Applicant::Sex.map{|i| [i,i]}
  end

  # 学历选项数组
  def education_select_arr
     Applicant::Education.map{|i| [i,i]}
  end

end
