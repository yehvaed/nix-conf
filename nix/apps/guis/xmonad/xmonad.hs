import XMonad
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing

main :: IO()
main = xmonad $ def { 
  terminal = "alacritty", 
  borderWidth = 2,
  layoutHook = gaps [(U,5),(D,5),(L,5),(R,5)] $ spacing 5 $ Tall 1 (6/100) (1/2)
}
