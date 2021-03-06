module CSS.Transform where

import Prelude

import Data.Generic (class Generic)

import CSS.Property (class Val, Value, value, noCommas)
import CSS.Size (Angle, Abs, Size)
import CSS.String (fromString)
import CSS.Stylesheet (CSS, key)

newtype Transformation = Transformation Value

derive instance eqTransformation :: Eq Transformation
derive instance ordTransformation:: Ord Transformation
derive instance genericTransformation :: Generic Transformation

instance valTransformation :: Val Transformation where
  value (Transformation v) = v

transform :: Transformation -> CSS
transform = key $ fromString "transform"

transforms :: Array Transformation -> CSS
transforms = key (fromString "transform") <<< noCommas

translate :: Size Abs -> Size Abs -> Transformation
translate x y = Transformation $ fromString "translate(" <> value [x, y] <> fromString ")"

rotate :: forall a. Angle a -> Transformation
rotate a = Transformation $ fromString "rotate(" <> value a <> fromString ")"
