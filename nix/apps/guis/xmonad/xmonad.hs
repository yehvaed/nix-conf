import XMonad
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig (additionalKeysP)

myConfig = def { 
  terminal = "alacritty", 
  borderWidth = 2,
  modMask = myModMask,
  layoutHook = gaps [(U,5),(D,5),(L,5),(R,5)] $ spacing 5 $ Tall 1 (6/100) (1/2)
}

myKeys  = 
  [ ("M-o", spawn "rofi -show run")
  ]

myModMask = mod4Mask

main :: IO()
main = xmonad $ myConfig `additionalKeysP` myKeys


