// 分页js

// 生成分页导航
function generate_pagination(current_page,total_page) {
  // 开始 结尾
  start_content  = "<ul class='pagination'>";
  end_content    = "</ul>";

  // 上一页 下一页
  previous_content = generate_previous_page(current_page);
  next_content     = generate_next_page(current_page,total_page);

  // 生成中间内容
  center_content = ''
  page_arr = fetch_display_page_number(current_page,total_page);
  for (i in page_arr) {
    if (current_page == page_arr[i]) {
      content = generate_li_a(current_page, page_arr[i],'active');
    } else {
      content = generate_li_a(current_page, page_arr[i],'');
    }
    center_content += content;
  }

  return start_content + previous_content + center_content + next_content + end_content;
}

// 生成 上一页
function generate_previous_page(current_page) {
  if (current_page == 1) {
    return generate_li_a(current_page, '上一页','disabled');
  } else {
    return generate_li_a(current_page, '上一页','');
  }
}

// 生成 下一页
function generate_next_page(current_page, last_page) {
  if (current_page == last_page) {
    return generate_li_a(current_page, '下一页','disabled');
  } else {
    return generate_li_a(current_page, '下一页','');
  }
}

// 当前页面url
function current_page_url() {
  return window.location.href.split('current_page')[0];
}

function url_page_num(current_page, name) { 
  if (name === '上一页') {
    return current_page - 1;
  } else if (name === '下一页') {
    return current_page + 1;
  } else {
    return name;
  }
}

// 生成 单个li链接
function generate_li_a(current_page, name, class_name){
  url_page_number = url_page_num(current_page, name);
  url  = current_page_url() + 'current_page=' + url_page_number;

  li_a = "<li class=" + "'" + class_name + "'" + ">";
  li_a += "<a href='" + url + "'>";
  li_a += name + "</a>";
  li_a += "</li>";
  
  return li_a;
}

// 生成展示页码
function fetch_display_page_number(current_page,total_page){
  page_arr   = [];
  first_page = 1;
  last_page  = total_page;
  
  // 前半部分
  if (current_page - 4 <= first_page) {
    // 当前页靠近首页 中间无 ...
    for (i = 1; i <= current_page; i++) {
      page_arr.push(i);
    }
  } else {
    page_arr.push(first_page);
    page_arr.push('...');
    page_arr.push(current_page - 3);
    page_arr.push(current_page - 2);
    page_arr.push(current_page - 1);
    page_arr.push(current_page);
  }
  
  // 后半部分
  if (current_page + 4 >= last_page) {
    // 当前页靠近最后一页 中间无 ...
    for (i=current_page + 1; i <= last_page; i++) {
      page_arr.push(i);
    }
  } else {
    page_arr.push(current_page + 1);
    page_arr.push(current_page + 2);
    page_arr.push(current_page + 3);
    page_arr.push('...');
    page_arr.push(last_page);
  }

  return page_arr;
}