# Import file "[ Desktop ] PDP Final to PROTOTYPE"
sketch4 = Framer.Importer.load("imported/[ Desktop ] PDP Final to PROTOTYPE@1.5x", scale: 1)


sketch4.stickyNav.visible = false
document.body.style.cursor = "auto"

scroll = new ScrollComponent
	size: Screen
	scrollHorizontal: false
	backgroundColor: "white"
# 	parent: all
scroll.mouseWheelEnabled = true
sketch4.PDP_3_COL.parent = scroll.content

scroll.on Events.Scroll, -> 
	if scroll.scrollY > sketch4.navbar.originY
		scroll.removeSubLayer(sketch4.navbar)
		scroll.addSubLayer(sketch4.navbar)
		sketch4.navbar.y + -1
		if scroll.scrollY > 400 and sketch4.PDP_3_COL.visible == true
			sketch4.stickyNav.visible = true
			scroll.removeSubLayer(sketch4.stickyNav)
			scroll.addSubLayer(sketch4.stickyNav)
			sketch4.stickyNav.y = sketch4.navbar.y + 58
			sketch4.stickyNav.x = -4
		else
			sketch4.stickyNav.visible = true
			scroll.removeSubLayer(sketch4.stickyNav)
			scroll.addSubLayer(sketch4.stickyNav)
			sketch4.stickyNav.y = sketch4.navbar.y - 59
			sketch4.stickyNav.x = -4
	else
	scroll.removeSubLayer(sketch4.navbar)
	scroll.addSubLayer(sketch4.navbar)
	sketch4.navbar.y = -1
	
# to get device screen Rendered Pixels
screen_width = Framer.Device.screen.width   # Rendered Pixels
screen_height = Framer.Device.screen.height # Rendered Pixels

default_w = 1440 #  <--  750 for iPhone6 width
default_h = 900 # <-- 1334 for iPhone6 height

ratio = screen_width / default_w

Framer.Defaults.Layer.force2d = true

all = new Layer
	width: default_w, height: default_h
	scale: ratio
	originY: 0
	y: 0
all.centerX()

############
content2 = scroll
content2.parent = all
content2.width = 1440
content2.height = 900
content2.centerX()

variant = [sketch4.var1, sketch4.var2, sketch4.var3, sketch4.var4]

for varr in variant
	varr.states = 
	clicked:
		opacity: 0
	unclicked:
		opacity: 1
	clicked2:
		opacity: 0
			
	varr.animationOptions =
		instant: true
	
sketch4.var1.onClick ->
	if sketch4.var2.states.current.name == "clicked" or sketch4.var2.states.current.name == "clicked2"
		sketch4.var2.stateSwitch("unclicked")
	sketch4.var1.stateCycle()
	
sketch4.var2.onClick -> 
	if sketch4.var1.states.current.name == "clicked" or sketch4.var1.states.current.name == "clicked2"
		sketch4.var1.stateSwitch("unclicked")
	sketch4.var2.stateCycle()
	
sketch4.var3.onClick -> 
	if sketch4.var4.states.current.name == "clicked" or sketch4.var4.states.current.name == "clicked2"
		sketch4.var4.stateSwitch("unclicked")
	sketch4.var3.stateCycle()
	
sketch4.var4.onClick -> 
	if sketch4.var3.states.current.name == "clicked" or sketch4.var3.states.current.name == "clicked2"
		sketch4.var3.stateSwitch("unclicked")
	sketch4.var4.stateCycle()

bgoverlay = new Layer
	x: 0
	y: 0
	width: all.width
	height: all.height
	backgroundColor: "black"
	opacity: 0.5
	parent: all
	visible: false

overlayImage = (layer, path,width,height) ->
	layer = new Layer
		parent: all
		width: width
		height: height
		visible: true
		image: path
	return layer

temp = ""
sketch4.btn_pesan .onClick ->
	bgoverlay.visible = true
	bgoverlay.center()
	temp = overlayImage(temp,"images/modal_pesan.jpg",600, 475)
	temp.center()
	temp.y -= 100

sketch4.btn_beli .onClick ->
	bgoverlay.visible = true
	bgoverlay.center()
	temp = overlayImage(temp,"images/modal_beli.jpg",706, 531)
	temp.center()
	temp.y -= 100
	
sketch4.Group_8 .onClick ->
	bgoverlay.visible = true
	bgoverlay.center()
	temp = overlayImage(temp,"images/modal_beli.jpg",706, 531)
	temp.center()
	temp.y -= 100

bgoverlay.onClick ->
	bgoverlay.visible = false
	temp.destroy()

sketch4.form_kecamatan.states =
	filled:
		opacity: 0
sketch4.form_kecamatan.onClick ->
	sketch4.form_kecamatan.stateSwitch("filled")
	
sketch4.form_kodePos.states =
	filled:
		opacity: 0
sketch4.form_kodePos.onClick ->
	sketch4.form_kodePos.stateSwitch("filled")

sketch4.estimasi_ongkir.visible = false
sketch4.btn_hitungOngkir.onClick ->
	if sketch4.form_kecamatan.states.current.name == "filled" and sketch4.form_kodePos.states.current.name == "filled"
		sketch4.estimasi_ongkir.visible = true
		sketch4.belowFold.y = sketch4.estimasi_ongkir.y + sketch4.estimasi_ongkir.height + 40

sketch4.btn_favToko.states = 
clicked:
	opacity: 0
unclicked:
	opacity: 1
clicked2:
	opacity: 0
sketch4.btn_favToko.animationOptions =
	instant: true
sketch4.btn_favToko.onClick ->
	sketch4.btn_favToko.stateCycle()

sketch4.btn_wishlist.states = 
clicked:
	opacity: 0
unclicked:
	opacity: 1
clicked2:
	opacity: 0
sketch4.btn_wishlist.animationOptions =
	instant: true

sketch4.btn_wishlist2.states = 
clicked:
	opacity: 0
unclicked:
	opacity: 1
clicked2:
	opacity: 0
sketch4.btn_wishlist2.animationOptions =
	instant: true

sketch4.btn_wishlist.onClick ->
	sketch4.btn_wishlist.stateCycle()
	sketch4.btn_wishlist2.stateCycle()

sketch4.btn_wishlist2.onClick ->
	sketch4.btn_wishlist.stateCycle()
	sketch4.btn_wishlist2.stateCycle()

merchantPage = ""
sketch4.logo_toko.onClick ->
	sketch4.PDP_3_COL.visible = false
	scroll.addSubLayer(sketch4.navbar)
	sketch4.stickyNav.visible = false
	merchantPage = new Layer
		parent: scroll.content
		width: Screen.width
		html: "<img src='images/merchant.jpg' width=auto height=100%>"
		backgroundColor: "white"

sketch4.nama_toko.onClick ->
	sketch4.PDP_3_COL.visible = false
	scroll.addSubLayer(sketch4.navbar)
	sketch4.stickyNav.visible = false
	merchantPage = new Layer
		parent: scroll.content
		width: Screen.width
		html: "<img src='images/merchant.jpg' width=auto height=100%>"
		backgroundColor: "white"

back_btn = new Layer
	backgroundColor: "transparent"
	x: 0
	y: 0
	height: 200
	width: 200

back_btn.onClick ->
	merchantPage.destroy()
	sketch4.PDP_3_COL.visible = true