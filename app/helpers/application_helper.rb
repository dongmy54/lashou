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

  # 职位发布时间 描述
  def publish_time_desc(created_at)
    time_desc = distance_of_time_in_words(Time.now, created_at)
    if time_desc.end_with?('天')
      time_desc + '前发布'
    else
      time_desc + '前'
    end
  end

  # 输入 断句
  def content_split_sentence(content)
    content.split("\n")
  end

  # 创建 简历选项 html
  def generate_resume_select_html(resume_arrs)
    select_tag :resume_id, options_for_select(resume_arrs), class: "form-control"
  end

end
