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

#NoTrayIcon

Global Const $Config = "RememberAcc.ini"

#Region ### START Koda GUI section ### Form=
Global $LRform = GUICreate("Edgar';s System Script Login/Register", 465, 277, -1, -1)
Global $LabelUsername = GUICtrlCreateLabel("Username", 40, 80, 89, 29)
GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
Global $LabelPassword = GUICtrlCreateLabel("Password", 40, 120, 84, 29)
GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
Global $InputUsername = GUICtrlCreateInput("", 144, 72, 281, 33)
GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
Global $InputPassword = GUICtrlCreateInput("", 144, 128, 281, 33, BitOR($GUI_SS_DEFAULT_INPUT,$ES_PASSWORD))
GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
Global $BtnLogin = GUICtrlCreateButton("Login", 304, 216, 107, 41)
GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
Global $BtnRegister = GUICtrlCreateButton("Register", 168, 216, 123, 41)
GUICtrlSetFont(-1, 14, 400, 0, "Segoe UI")
Global $Title = GUICtrlCreateLabel("Edgar's System Script V1.2", 96, 16, 284, 36)
GUICtrlSetFont(-1, 18, 400, 0, "Segoe UI")
Global $RememberCB = GUICtrlCreateCheckbox("Remember Password", 240, 184, 177, 17)
GUICtrlSetFont(-1, 12, 400, 0, "Segoe UI")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


RestoreAccount()

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		; Case nút thoát chương trình
		Case $GUI_EVENT_CLOSE
			Exit

		; Case nút đăng nhập
		Case $BtnLogin
			; Đọc tên người dùng
			; Đọc mật khẩu
			; Kiểm tra xem tên người dùng có chính xác hay không
			; Nếu đúng thì hiển thị thông báo đăng nhập thành công
			; Nếu sai thì hiển thị thông báo đăng nhập thất bại
			Local $username = GUICtrlRead($InputUsername)
			Local $password = GUICtrlRead($InputPassword)

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

					; kiểm tra xem người dùng có muốn ghi nhớ tài khoản hay không
					If(GUICtrlRead($RememberCB) = $GUI_CHECKED) Then
						SaveAccount($username, $password, True)
					Else
						FileDelete($Config)
					EndIf

			EndSelect


		; Case nút đăng ký
		Case $BtnRegister
			MsgBox(0, 'ERROR 404', 'Chức năng này hiện đang được phát triển !' & @CRLF & 'Mời bạn sử dụng chức năng đăng nhập')

		; Case ghi nho tai khoan
		Case $RememberCB

	EndSwitch
WEnd


Func SaveAccount($username, $password, $Remember)
	IniWrite($Config, 'account', 'username', $username)
	IniWrite($Config, 'account', 'password', $password)
	IniWrite($Config, 'account', 'remember', $Remember)
EndFunc

Func RestoreAccount()
	Local $Remember = IniRead($Config, 'account', 'remember', False)

	If $Remember == True Then
		Local $username = IniRead($Config, 'account', 'username', '')
		Local $password = IniRead($Config, 'account', 'password', '')

		GUICtrlSetData($InputUsername, $username)
		GUICtrlSetData($InputPassword, $password)
		GUICtrlSetState($RememberCB, $GUI_CHECKED)
	EndIf

EndFunc