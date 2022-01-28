;; -*- lexical-binding: t; -*-

;; JS実装は thunk を undefinedで上書きしている(GCのため？)。
;; 倣って計算後はthunkをnilにsetqする(引数一つなので部分適用は心配しなくてもいいはず)。
(defvar Data.Lazy.defer
  (lambda (thunk)
    (let ((val nil))
      (lambda ()
        (when thunk
          (setq val (funcall thunk nil))
          (setq thunk nil))
        val))))

(defvar Data.Lazy.force
  (lambda (l)
    (funcall l)))
