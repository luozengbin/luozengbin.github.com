;; Filename: profile.el
;; Description: a profile focuses on what's important or interesting about me
;; Author: luozengbin <jalen.cn_at_gmail.com>
;; Maintainer: luozengbin
;; Copyright (C) :2014,2015 luozengbin all rights reserved.
;; Created: :2014-10-11
;; Version: 1.0.0
;; URL: https://luoznegbin.github.io/profile.el

;;; Changelog:

;;
;; 2015-05-09 update skill content
;;

(require 'profile-support)

(message "Hello World")                 ; => "Hello World"

(defstruct human name sex birthday address description skills qualifications publish contact favicon status)

(setq me (make-human
          :name '((chinese-name  .  "LuoZengBin")
                  (japanese-name .  "Wakana Akira"))
          :sex                      "male"
          :birthday                 "1984~2005, Fujian, China"
          :address                  "2005~2015, Tokyo,  Japan"
          :description              "a programmer work in SIer company"
          :skills                 '("Java" "Linux" "Elisp")
          :qualifications         '("2014 Linux Professional Institute Certification Level 2"
                                    "2013 Product Specialist for RedHat JBoss EAP"
                                    "2013 Product Specialist for RedHat JDG"
                                    "2013 Product Specialist for RedHat JBoss EDS"
                                    "2013 Product Specialist for RedHat JBoss BRMS"
                                    "2011 Product Specialist for Oracle SOA/BPM Suite"
                                    "2010 Oracle Silver DBA 10g")
          :publish   '((blog     .  "http://luozengbin.github.io/"))
          :contact   '((mail     .  "jalen.cn_at_gmail.com")
                       (twitter  .  "@luozengbin")
                       (github   .  "https://github.com/luozengbin")
                       (facebook .  "https://www.facebook.com/luozengbin/allactivity"))
          :favicon  ""
          :status    '(lambda () (if (is-holiday (current-time))
                                     '("Child Rearing" "Coding" "Sleeping")
                                   '("Working" "Sleeping")))))


(funcall (human-status me))             ; => ("Child Rearing" "Coding" "Sleeping")
