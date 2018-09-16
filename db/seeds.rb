# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 创建求职者
10.times do
  applicant = Applicant.create!(
                :address      => Faker::Address.full_address,
                :age          => rand(1..80),
                :blog_address => "httpt://exmaple.com/b-rand(1..10)-a",
                :city         => Faker::Address.city,
                :education    => Applicant::Education.sample,
                :email        => Faker::Internet.email,
                :mobile       => "1" + (Array.new(10) {rand(0..9)}).join(''),
                :name         => Faker::Name.unique.name,
                :password     => '123456',
                :school       => Faker::University.name,
                :sex          => Applicant::Sex.sample
                )

  applicant.resumes.create!(
            :apply_reason       => "软件开发一直以来，都是我的梦想。我了解自己，喜欢逻辑、喜欢挑战， 我知道做程序十分适合自己。我相信只有喜欢，才能做的更好。\r\n自己非常想加入有发展潜力的初创公司，显然友好速搭就是这样一家公 司，自己非常看好SaaS行业。我非常有意愿加入友好速搭这个优秀的团 队。\r\n",
            :brief_intro        => "生于92年，大学本科，四川人，现坐标成都，愿意到深圳工作。\r\n迄今为止，实际部署运维项目五个，个人github专案23个，技术博客 240余篇。具备扎实的Ruby on Rails网页开发经验和技能。我在拉勾网 上了解到友好速搭 ruby工程师机会，我希望申请友好速搭 ruby工程师 岗位工作。",
            :career_experience  => "15年我大学毕业，去了一家上市公司，做管理工作。尽管工作很顺利、 领导也很赏识，但出于对程序的热爱，我毅然放弃了那份在别人眼中不错 的工作，选择在一年多后辞职。\r\n然后，开始了近一年的程序学习之旅，高效的学习了Ruby on Rails快速 开发、API设计、RSpec测试、Ajax网页交互、数据库原理以及sql语 句、部署操作、git版本控制、SEO搜索优化、代码重构与效能提升等一 系列开发实用技能。\r\n于此同时，我也开发出了多个属于自己的网站，其中包括:购物网站、 ror测试系统、菜品搜等。",
            :life_creed         => '一个不畏bug，逻辑能力强的持续学习者',
            :project_experience => "项目1链接:https://ilife.herokuapp.com\r\nILIFE - 一个致力于打造健康、便捷家居的网上商城\r\n这是一个两人开发的家居商城网站。做为主程的我担任了主要功能和4个 重点页面的编写，主要实现了:多图上传、商品留言、客服聊天、下单寄 信、验证码登录、后台出货、收藏商品等功能。",
            :special_skill      => "具有较强的逻辑思维能力，擅长将复杂问题分解逐步处理，性格坚 韧，遇到困难能够持续作战 学习能力强，成长速度快、求知欲望极强，可以迅速适应程序工作 环境 除了具备后端开发能力外，也具备前端CSS、HTM、javascript基 础\r\n",
            :title              => "我的第一份简历"
            )
end
puts '-------------求职者、简历创建完成---------------'


Industry::Type.each do |type|
  industry = Industry.create!(name: type)

  puts "------#{type}行业被成功创建--------"

  # 每个行业 十家公司
  10.times do
    # 找一个还没有被用的名字
    name = Faker::Company.name
    while Company.find_by_name(name)
      name = Faker::Company.name
    end

    industry.companies.create!(
      :city            => Faker::Address.city,
      :desc            => '我们是一家积极阳光的公司,工作氛围轻松。',
      :name            =>  name,
      :password        => '123456', 
      :scale           => Company::Scale.sample
      )
    puts "------------#{type}行业：#{name}公司成功创建-------------"
  end
end
puts '-------------行业、公司创建完成---------------'


# 取一家公司 审核通过 创建account
company = Company.first
company.update!(:status => '审核通过')

company.accounts.create!(name: '张三', password: '123456', is_main: true)  # 主账号
company.accounts.create!(name: '王五', password: '123456', is_main: false)

puts '------------- account 创建完成--------------'



