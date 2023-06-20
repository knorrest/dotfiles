{:user {:plugins [;[lein-localrepo "0.5.4"]
                  [lein-ancient  "0.6.15"]
                  [lein-nvd  "1.4.1"]
                  [lein-ns-dep-graph  "0.4.0-SNAPSHOT"]
                  [lein-pprint  "1.2.0"]
                  ;[lein-cloverage  "1.1.2"]
                  ]
        :dependencies [[philoskim/debux  "0.8.1"]]}
 :vim [:dev
       {:plugins [[cider/cider-nrepl  "0.25.5"]
                  [venantius/ultra  "0.6.0"]]} ]
 :code [:dev
        {:dependencies [[nrepl "1.0.0"]
                        [eftest  "0.5.9"]]
         :plugins [[cider/cider-nrepl "0.30.0"]]}]
 :rebl [:dev 
        {:resource-paths  ["/Users/kalle/REBL/REBL-0.9.220/REBL-0.9.220.jar"]
         :dependencies  [[org.clojure/core.async  "0.4.490"]
                         [cljfmt  "0.6.4"]]}]
 }
