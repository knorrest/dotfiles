{:user {:plugins [;[lein-localrepo "0.5.4"]
                  [lein-pprint  "1.2.0"]
                  [lein-cloverage  "1.1.2"]]}
 :vim [:dev
       {:plugins [[cider/cider-nrepl  "0.25.5"]
                  [venantius/ultra  "0.6.0"]]} ]
 :code [:dev
        {:dependencies [[nrepl "0.6.0"]]
         :plugins [[cider/cider-nrepl "0.25.5"]]}]
 :rebl [:dev 
        {:resource-paths  ["/Users/kalle/REBL/REBL-0.9.220/REBL-0.9.220.jar"]
         :dependencies  [[org.clojure/core.async  "0.4.490"]
                         [cljfmt  "0.6.4"]]}]
 }
