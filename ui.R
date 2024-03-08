fluidPage(
  theme = shinytheme("united"),
  
  titlePanel("ふるさと納税データマップ"),
  
  tabsetPanel(
    tabPanel(
      "マップ",
      fluidRow(
        column(4,             
               selectInput(
                 "year", "年度",
                 c("2017", "2018", "2019", "2020", "2021", "2022", "2023"), selected="2023")
        ),
        
        column(8, 
               selectInput(
                 "col_id", "表示する項目",
                 c("人口（2020年）", "男性人口", "女性人口", "人口（2015年）", "5年間の人口増減数", 
                   "5年間の人口増減率", "人口密度", "世帯数", "受け入れた寄付件数", "受け入れた寄附金額", 
                   "市町村外から受け入れた寄付件数", "市町村外から受け入れた寄付金額", "返礼品等の調達に係る費用",
                   "返礼品等の送付に係る費用", "広報に係る費用", "決済等に係る費用", "事務に係る費用", 
                   "その他の費用", "費用合計", "一人当たりの市町村外から受け入れた寄付金額",
                   "一人当たりの市町村外から受け入れた寄付件数"), selected="一人当たりの市町村外から受け入れた寄付金額", width="600px")
        )
      ),
      
      div(leafletOutput("leafletPlot", height="100%"), style = "height: 73vh"),
      tags$footer("一人あたりの値は2020年人口を利用して計算しているため、正確ではありません。")
    ),
    tabPanel(
      "参考文献等",
      br(),
      p("出典：調査項目を調べる－国勢調査（総務省）令和２年国勢調査 人口等基本集計　（主な内容：男女・年齢・配偶関係，世帯の構成，住居の状態，母子・父子世帯，国籍など）"),
      tags$a(href="https://www.e-stat.go.jp/stat-search/files?page=1&layout=datalist&toukei=00200521&tstat=000001136464&cycle=0&tclass1=000001136466&tclass2val=0&metadata=1&data=1", "政府統計の総合窓口（e-Stat）該当ページ"),
      br(),
      br(),
      p("出典：国土交通省国土数値情報ダウンロードサイト 行政区域データ(2024年) 全国データ"),
      tags$a(href="https://nlftp.mlit.go.jp/ksj/gml/datalist/KsjTmplt-N03-2024.html", "国土数値情報ダウンロードサイト 該当ページ"),
      br(),
      br(),
      p("出典：総務省 ふるさと納税ポータルサイト 関連資料 受入額の実績等"),
      tags$a(href="https://www.soumu.go.jp/main_sosiki/jichi_zeisei/czaisei/czaisei_seido/furusato/archive/", "ふるさと納税ポータルサイト 該当ページ")
    )
    
  )
  

)
