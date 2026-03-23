; Program 2 - List Processor
; This program takes numbers from the user, stores them in a list,
; and lets the user choose different operations from a menu.

; This function counts how many elements are in the list
(defun count-elements (num-list)
  (length num-list)
)

; This function adds all numbers in the list and returns the total
(defun sum-elements (num-list)
  (let ((total 0)) ; start total at 0
    (dolist (num num-list total) ; go through each number
      (setq total (+ total num)) ; add each number to total
    )
  )
)

; This function finds the largest number in the list
(defun find-maximum (num-list)
  (let ((largest (car num-list))) ; start with first element
    (dolist (num num-list largest)
      (if (> num largest)
          (setq largest num) ; update if bigger number is found
      )
    )
  )
)

; This function counts how many times a number appears in the list
(defun count-occurrences (num-list target)
  (let ((count 0)) ; start count at 0
    (dolist (num num-list count)
      (if (= num target)
          (setq count (+ count 1)) ; increase count if match found
      )
    )
  )
)

; variables to store list and user input
(defvar my-list nil)
(defvar input-number 0)
(defvar answer 'y)
(defvar choice 0)
(defvar target 0)

; loop to take numbers from user
(loop
  (format t "Enter a number for the list:~%")
  (setq input-number (read))
  (setq my-list (append my-list (list input-number)))

  (format t "Enter more numbers y/n~%")
  (setq answer (read))

  (when (or (equal answer 'n) (equal answer 'N))
    (return) ; stop when user says no
  )
)

; show the list
(format t "Here is what was read into the list ~A~%" my-list)

; menu loop
(loop
  (format t "Choose an option:~%")
  (format t "1 - Count elements~%")
  (format t "2 - Sum elements~%")
  (format t "3 - Find maximum~%")
  (format t "4 - Count occurrences~%")
  (format t "5 - Exit~%")

  (setq choice (read))

  (cond
    ((= choice 1)
      (format t "There are ~D elements in the list.~%"
              (count-elements my-list))
    )
    ((= choice 2)
      (format t "The sum of the elements is ~D.~%"
              (sum-elements my-list))
    )
    ((= choice 3)
      (format t "The largest number in the list is ~D.~%"
              (find-maximum my-list))
    )
    ((= choice 4)
      (format t "Enter number to search for:~%")
      (setq target (read))
      (format t "There are ~D occurrences of ~D in the list.~%"
              (count-occurrences my-list target) target)
    )
    ((= choice 5)
      (return) ; exit program
    )
    (t
      (format t "Invalid choice. Please try again.~%")
    )
  )
)