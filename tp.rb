          / ==============================================================
          / Sales chart
          / ==============================================================
          .row
            .col-md-8
              .card
                .card-body
                  .d-md-flex.align-items-center
                    %div
                      %h4.card-title Sales Summary
                      %h5.card-subtitle Overview of Latest Month
                    .ml-auto.d-flex.no-block.align-items-center
                      %ul.list-inline.font-12.dl.m-r-15.m-b-0
                        %li.list-inline-item.text-info
                          %i.fa.fa-circle
                          Iphone
                        %li.list-inline-item.text-primary
                          %i.fa.fa-circle
                          Ipad
                  .row
                    / column
                    .col-lg-12
                      .campaign.ct-charts
                    / column
            .col-md-4
              .card
                .card-body
                  %h4.card-title Feeds
                  .feed-widget
                    %ul.list-style-none.feed-body.m-0.p-b-20
                      %li.feed-item
                        .feed-icon.bg-info
                          %i.far.fa-bell
                        You have 4 pending tasks.
                        %span.ml-auto.font-12.text-muted Just Now
                      %li.feed-item
                        .feed-icon.bg-success
                          %i.ti-server
                        Server #1 overloaded.
                        %span.ml-auto.font-12.text-muted 2 Hours ago
                      %li.feed-item
                        .feed-icon.bg-warning
                          %i.ti-shopping-cart
                        New order received.
                        %span.ml-auto.font-12.text-muted 31 May
                      %li.feed-item
                        .feed-icon.bg-danger
                          %i.ti-user
                        New user registered.
                        %span.ml-auto.font-12.text-muted 30 May
          / ==============================================================
          / Sales chart
          / ==============================================================
          / ==============================================================
          / Table
          / ==============================================================
          .row
            / column
            .col-12
              .card
                .card-body
                  / title
                  .d-md-flex.align-items-center
                    %div
                      %h4.card-title Top Selling Products
                      %h5.card-subtitle Overview of Top Selling Items
                    .ml-auto
                      .dl
                        %select.custom-select
                          %option{:selected => "selected", :value => "0"} Monthly
                          %option{:value => "1"} Daily
                          %option{:value => "2"} Weekly
                          %option{:value => "3"} Yearly
                  / title
                .table-responsive
                  %table.table.v-middle
                    %thead
                      %tr.bg-light
                        %th.border-top-0 Products
                        %th.border-top-0 License
                        %th.border-top-0 Support Agent
                        %th.border-top-0 Technology
                        %th.border-top-0 Tickets
                        %th.border-top-0 Sales
                        %th.border-top-0 Earnings
                    %tbody
                      %tr
                        %td
                          .d-flex.align-items-center
                            .m-r-10
                              %a.btn.btn-circle.btn-info.text-white EA
                            %div
                              %h4.m-b-0.font-16 Elite Admin
                        %td Single Use
                        %td John Doe
                        %td
                          %label.label.label-danger Angular
                        %td 46
                        %td 356
                        %td
                          %h5.m-b-0 $2850.06
                      %tr
                        %td
                          .d-flex.align-items-center
                            .m-r-10
                              %a.btn.btn-circle.btn-orange.text-white MA
                            %div
                              %h4.m-b-0.font-16 Monster Admin
                        %td Single Use
                        %td Venessa Fern
                        %td
                          %label.label.label-info Vue Js
                        %td 46
                        %td 356
                        %td
                          %h5.m-b-0 $2850.06
                      %tr
                        %td
                          .d-flex.align-items-center
                            .m-r-10
                              %a.btn.btn-circle.btn-success.text-white MP
                            %div
                              %h4.m-b-0.font-16 Material Pro Admin
                        %td Single Use
                        %td John Doe
                        %td
                          %label.label.label-success Bootstrap
                        %td 46
                        %td 356
                        %td
                          %h5.m-b-0 $2850.06
                      %tr
                        %td
                          .d-flex.align-items-center
                            .m-r-10
                              %a.btn.btn-circle.btn-purple.text-white AA
                            %div
                              %h4.m-b-0.font-16 Ample Admin
                        %td Single Use
                        %td John Doe
                        %td
                          %label.label.label-purple React
                        %td 46
                        %td 356
                        %td
                          %h5.m-b-0 $2850.06
          / ==============================================================
          / Table
          / ==============================================================
          / ==============================================================
          / Recent comment and chats
          / ==============================================================
          .row
            / column
            .col-lg-6
              .card
                .card-body
                  %h4.card-title Recent Comments
                .comment-widgets.scrollable
                  / Comment Row
                  .d-flex.flex-row.comment-row.m-t-0
                    .p-2
                      %img.rounded-circle{:alt => "user", :src => "http://p7.qhimg.com/t01a4b62d3c967c19cb.png", :width => "50"}/
                    .comment-text.w-100
                      %h6.font-medium James Anderson
                      %span.m-b-15.d-block Lorem Ipsum is simply dummy text of the printing and type setting industry.
                      .comment-footer
                        %span.text-muted.float-right April 14, 2016
                        %span.label.label-rounded.label-primary Pending
                        %span.action-icons
                          %a{:href => "javascript:void(0)"}
                            %i.ti-pencil-alt
                          %a{:href => "javascript:void(0)"}
                            %i.ti-check
                          %a{:href => "javascript:void(0)"}
                            %i.ti-heart
                  / Comment Row
                  .d-flex.flex-row.comment-row
                    .p-2
                      %img.rounded-circle{:alt => "user", :src => "http://p7.qhimg.com/t01a4b62d3c967c19cb.png", :width => "50"}/
                    .comment-text.active.w-100
                      %h6.font-medium Michael Jorden
                      %span.m-b-15.d-block Lorem Ipsum is simply dummy text of the printing and type setting industry.
                      .comment-footer
                        %span.text-muted.float-right April 14, 2016
                        %span.label.label-success.label-rounded Approved
                        %span.action-icons.active
                          %a{:href => "javascript:void(0)"}
                            %i.ti-pencil-alt
                          %a{:href => "javascript:void(0)"}
                            %i.icon-close
                          %a{:href => "javascript:void(0)"}
                            %i.ti-heart.text-danger
                  / Comment Row
                  .d-flex.flex-row.comment-row
                    .p-2
                      %img.rounded-circle{:alt => "user", :src => "http://p7.qhimg.com/t01a4b62d3c967c19cb.png", :width => "50"}/
                    .comment-text.w-100
                      %h6.font-medium Johnathan Doeting
                      %span.m-b-15.d-block Lorem Ipsum is simply dummy text of the printing and type setting industry.
                      .comment-footer
                        %span.text-muted.float-right April 14, 2016
                        %span.label.label-rounded.label-danger Rejected
                        %span.action-icons
                          %a{:href => "javascript:void(0)"}
                            %i.ti-pencil-alt
                          %a{:href => "javascript:void(0)"}
                            %i.ti-check
                          %a{:href => "javascript:void(0)"}
                            %i.ti-heart
            / column
            .col-lg-6
              .card
                .card-body
                  %h4.card-title Temp Guide
                  .d-flex.align-items-center.flex-row.m-t-30
                    .display-5.text-info
                      %i.wi.wi-day-showers
                      %span
                        73
                        %sup °
                    .m-l-10
                      %h3.m-b-0 Saturday
                      %small Ahmedabad, India
                  %table.table.no-border.mini-table.m-t-20
                    %tbody
                      %tr
                        %td.text-muted Wind
                        %td.font-medium ESE 17 mph
                      %tr
                        %td.text-muted Humidity
                        %td.font-medium 83%
                      %tr
                        %td.text-muted Pressure
                        %td.font-medium 28.56 in
                      %tr
                        %td.text-muted Cloud Cover
                        %td.font-medium 78%
                  %ul.row.list-style-none.text-center.m-t-30
                    %li.col-3
                      %h4.text-info
                        %i.wi.wi-day-sunny
                      %span.d-block.text-muted 09:30
                      %h3.m-t-5
                        70
                        %sup °
                    %li.col-3
                      %h4.text-info
                        %i.wi.wi-day-cloudy
                      %span.d-block.text-muted 11:30
                      %h3.m-t-5
                        72
                        %sup °
                    %li.col-3
                      %h4.text-info
                        %i.wi.wi-day-hail
                      %span.d-block.text-muted 13:30
                      %h3.m-t-5
                        75
                        %sup °
                    %li.col-3
                      %h4.text-info
                        %i.wi.wi-day-sprinkle
                      %span.d-block.text-muted 15:30
                      %h3.m-t-5
                        76
                        %sup °
          / ==============================================================
          / Recent comment and chats
          / ==============================================================
        / ==============================================================
        / End Container fluid
        / ==============================================================
        / ==============================================================
        / footer
        / ==============================================================