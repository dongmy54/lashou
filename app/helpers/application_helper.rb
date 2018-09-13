module ApplicationHelper
  # 简历详情页 子标题
  def resume_sub_title(applicant)
    [
      number_to_phone(applicant.mobile),
      applicant.city,
      "#{applicant.age}岁",
      applicant.education
    ].join(' | ')
  end

  # 详细描述 html 内容
  def resume_desc_html_content(desc)
    content = ''
    # 按 初始输入分段
    desc.split("\r\n").each do |paragraph|
      content += "<p>" + paragraph + "</p>"
    end
    # 让字符串中 p 标签正常显示
    sanitize content, tags: %w(p) 
  end
end
