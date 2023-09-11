; Google Chrome

; Reload page
Chrome_7() {
   Send, {F5}
   return 1
}

; Reload page without cache
Chrome_Ctrl7() {
   Send, ^{F5}
   return 1
}

; Reload page without cache
Chrome_Zero7() {
   Send, ^{F5}
   return 1
}