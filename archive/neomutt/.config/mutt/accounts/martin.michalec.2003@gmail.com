# header information {{{
	set realname = "Martin Michalec"
	set from = "martin.michalec.2003@gmail.com"
# }}}
# SMTP information {{{
	set smtp_url = "smtp://martin.michalec.2003@smtp.gmail.com:587"
	set smtp_pass = `pass E-mail/$from`
# }}}
# mailboxes {{{
	set folder = "~/mail/$from/"
	unmailboxes *
	named-mailboxes \
		"Inbox"     "+Inbox/"             \
		"Important" "+[Gmail]/Important/" \
		"Starred"   "+[Gmail]/Starred/"   \
		"Drafts"    "+[Gmail]/Drafts/"    \
		"Sent Mail" "+[Gmail]/Sent Mail/" \
		"All Mail"  "+[Gmail]/All Mail/"  \
		"Trash"     "+[Gmail]/Trash/"     \
		"Spam"      "+[Gmail]/Spam/"
	set spoolfile = "+Inbox/"
	set record    = "+[Gmail]/Sent Mail/"
	set postponed = "+[Gmail]/Drafts/"
	set trash     = "+[Gmail]/Trash/"
# }}}

set signature = "sign-mail default|"

# vim: ft=muttrc
