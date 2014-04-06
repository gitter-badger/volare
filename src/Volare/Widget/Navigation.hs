module Volare.Widget.Navigation (
    Page(..),
    navigation
) where

import qualified Data.Text as T

import Volare.Foundation
import Volare.Settings (widgetFile)


data Page = FLIGHTS
          | WORKSPACES
          | WAYPOINTS
  deriving (Show, Eq)


navigation :: Page ->
              Widget
navigation page = $(widgetFile "widgets/navigation")
  where
    classes p | p == page = "active" :: T.Text
              | otherwise = ""
