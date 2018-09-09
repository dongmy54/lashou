module ResumesHelper

  # 简历缩略图 颜色 和 图标类
  # index 第几个简历
  def thumb_item_color_glyphicon_class(index)
    {
      :'0' => ['color-info','glyphicon-heart'],
      :'1' => ['color-warning', 'glyphicon-apple'],
      :'2' => ['color-success', 'glyphicon-grain']
    }[index.to_s.to_sym]
  end

end
