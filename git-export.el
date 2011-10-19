(defun git-export (destination)
  "Uses rsync to export the current git repository to DESTINATION,
excluding the .git subdirectory. Like 'svn export' for git where
the destination path can be a remote directory.

For example, if the current buffer is visiting the file
/home/mee/src/someproj/lib/foo/foo.pm, git-export will ascend
into the parent directory repeatedly until it finds the git
metadata directory in /home/mee/src/someproj/.git and then
execute:

  rsync -avC --exclude '.git' /home/mee/src/someproj DESTINATION

Note that the trailing slash is removed from the directory before
it is given to rsync, so DESTINATION only needs to specify the
path you'd like the someproj directory to be created in.
"
  (interactive "sdestination: ")
  (let ((file-name (buffer-file-name (current-buffer))))
    (when (null file-name)
      (error "Current buffer is not associated with a file"))
    (let ((project-dir (find-git-dir file-name)))
      (call-process-shell-command "/usr/bin/rsync" nil nil nil
                                  "-avC" "--exclude '.git'"
                                  (shell-quote-argument project-dir)
                                  (shell-quote-argument destination)))))

(defun find-git-dir (dir)
  (if (not (file-directory-p dir)) (find-git-dir (file-name-directory dir))
    (if (equal dir "/") (error "Could not find git parent directory")
      (if (directory-files dir t ".git") (remove-trailing-slash dir)
        (find-git-dir (parent-dir dir))))))

(defun remove-trailing-slash (dir)
  (if (equal "/" (substring dir -1)) (substring dir 0 -1) dir))

;; are there really not built-in functions for these?
(defun parent-dir (dir)
  (let* ((parent-dirs (init (split-string dir "/" t)))
         (parent-path (cons "/" (intercalate "/" parent-dirs))))
    (mapconcat 'id parent-path "")))

(defun intercalate (sep list)
  (let ((head (car list))
        (tail (cdr list)))
    (if (atom tail) (cons head (cons sep tail))
      (cons head (cons sep (intercalate sep tail))))))

(defun init (list)
  (reverse (cdr (reverse list))))

(defun id (x) x)

(provide 'git-export)
