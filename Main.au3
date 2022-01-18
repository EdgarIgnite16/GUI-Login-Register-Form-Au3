#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author: Edgar Ignite

 Script Function: Login/Register From using Koda design.

#ce ----------------------------------------------------------------------------
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$From1 = GUICreate("Edgar';s System Script Login/Register", 475, 271, -1, -1)
$Label1 = GUICtrlCreateLabel("Username", 40, 80, 89, 29)
GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
$Label2 = GUICtrlCreateLabel("Password", 40, 120, 84, 29)
GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
$Input1 = GUICtrlCreateInput("", 144, 72, 281, 33)
GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
$Input2 = GUICtrlCreateInput("", 144, 128, 281, 33, BitOR($GUI_SS_DEFAULT_INPUT,$ES_PASSWORD))
GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
$Button1 = GUICtrlCreateButton("Login", 304, 208, 107, 41)
GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
$Button2 = GUICtrlCreateButton("Register", 168, 208, 123, 41)
GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
$Label3 = GUICtrlCreateLabel("Edgar's System Script V1.2", 96, 16, 284, 36)
GUICtrlSetFont(-1, 18, 400, 0, "Segoe UI")
$Radio1 = GUICtrlCreateCheckbox("Remember Password", 248, 176, 177, 17)
GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		; Case nút thoát chương trình
		Case $GUI_EVENT_CLOSE
			Exit

		; Case nút đăng nhập
		Case $Button1
			; Đọc tên người dùng
			; Đọc mật khẩu
			; Kiểm tra xem tên người dùng có chính xác hay không
			; Nếu đúng thì hiển thị thông báo đăng nhập thành công
			; Nếu sai thì hiển thị thông báo đăng nhập thất bại
			Local $username = GUICtrlRead($Input1)
			Local $password = GUICtrlRead($Input2)

			Select
				Case $username == '' And $password == ''
					MsgBox(0, 'Login Fail', 'Vui lòng nhập tài khoản và mật khẩu !')

				Case $username == ''
					MsgBox(0, 'Login Fail', 'Vui lòng nhập tài khoản !')

				Case $password == ''
					MsgBox(0, 'Login Fail', 'Vui lòng nhập mật khẩu !')

				Case $username <> 'admin' And $password <> 'edgar123'
					MsgBox(0, 'Login Fail', 'Bạn không có quyền truy cập !' & @CRLF & 'Chức năng này hiện chỉ được dùng cho quản trị viên !')

				Case $username == 'admin' And $password == 'edgar123'
					MsgBox(0, 'Login Success', 'Chào mừng admin đã đăng nhập !' & @CRLF & 'Chúc bạn có một ngày tốt lành !')
			EndSelect

		; Case nút đăng ký
		Case $Button2
			MsgBox(0, 'ERROR 404', 'Chức năng này hiện đang được phát triển !' & @CRLF & 'Mời bạn sử dụng chức năng đăng nhập')

	EndSwitch
WEnd

