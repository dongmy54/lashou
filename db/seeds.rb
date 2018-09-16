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

  # 待审核
  5.times do
    # 名字不重复
    name = SeedCompanyName.sample
    while Company.find_by_name(name)
      name = SeedCompanyName.sample
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

  # 审核通过
  5.times do
    name = SeedCompanyName.sample
    while Company.find_by_name(name)
      name = SeedCompanyName.sample
    end

    company = industry.companies.create!(
      :city            => Faker::Address.city,
      :desc            => '我们是一家积极阳光的公司,工作氛围轻松。',
      :name            =>  name,
      :password        => '123456', 
      :scale           => Company::Scale.sample,
      :status          => '审核通过'
      )
    
    company.accounts.create!(name: Faker::Name.unique.name, password: '123456', is_main: true)  # 主账号
    company.accounts.create!(name: Faker::Name.unique.name, password: '123456', is_main: false)

    puts '------------- 公司 account账户创建完成--------------'

    job = company.jobs.create!(
        :education         => Job::Education.sample,
        :end_salary        => rand(5..50),
        :job_desc          => "岗位职责：\n1、负责公司SAAS产品的市场调研、需求分析及功能设计；\n2、根据产品调研目标，输出高质量的竞品分析文档；\n3、根据产品阶段目标，分解产品功能结构，并输出用户体验好、逻辑清晰的产品原型；\n4、协调UI、UE进行产品信息架构设计、 交互设计及视觉设计；\n5、在产品用户体验层面，包含UX和UI层面，能够根据产品用户群体，对功能提出建设性的解决意见；\n6、产品开发推进过程中，能够快速高效的推动UI、研发和测试等的工作；\n7、对于产品需求的收集、分析、提炼、整理过程，能够根据产品的目标、资源等条件，进行正确的处理；\n\n任职要求：\n1、本科及以上学历，计算机、市场营销专业优先；\n2、3年及以上产品岗位经验，参加过完整的产品规划、需求设计和研发工作；\n3、具备高质量的产品原型、需求文档输出能力，此能力为必须具备的能力；\n4、具备竞品分析、行业分析、用户研究的能力和经验；\n5、熟悉交互规范、UI规范、原型规范，并能够根据产品目标构建不同的规范要求。\n6、熟练相应的产品工具，包括且不限于Axure、visio、mindjet等；\n\n7、对于社会变迁、人性、生活，有自己独立的思考能力；\n\n8、抗压力强，具备良好的沟通能力与团队协作能力，善于分享且需具有极强的执行力；\n",
        :name              => SeedJobName.sample,
        :start_salary      => rand(1..5),
        :worker_type       => Job::WorkerType.sample,
        :worker_experience => Job::WorkerExperience.sample
      )
    puts "------------#{type}行业：#{name}公司 #{job.name}工作成功创建-------------"
  end

end
puts '======================行业、公司、账户、职位 创建完成====================='





