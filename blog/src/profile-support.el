;;; profile-support.el --- profile support functions

;; Copyright (C) 2014-2015 Free Software Foundation,
;; Inc.

;; Author: luozengbin <jalen.cn_at_gmail.com>
;; Maintainer: luozengbin
;; Keywords: profile

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; profile-support is a function set for my profile.el
;;

;;; Code:


(require 'japanese-holidays)
(defun is-holiday (xx-date)
  (let* ((d1 (time-to-days xx-date))
         (date (calendar-gregorian-from-absolute d1))
         (weekday (nth 6 (decode-time xx-date)))
         (displayed-month (nth 0 date))
         (displayed-year (nth 2 date))
         (x-holiday-list (car
                          (loop for p in japanese-holidays
                                when (eval p)
                                collect (eval p)))))
    (cond ((eq weekday 6)
           "土曜日")
          ((eq weekday 0)
           "日曜日")
          (t
           (loop for x in x-holiday-list
                 when (eq d1 (calendar-absolute-from-gregorian (car x)))
                 return (car (cdr x)))))))

(provide 'profile-support)
