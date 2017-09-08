# Created for Instructional purposes
# Anurag Bisht (day.dreamer.3d@gmailc.om)
# Copyright(Copy the code right way) XD :D :D

# -----------------------------------------------------------

# Source clips
left_frame_clip = AVISource("Path Here")
top_frame_clip = ImageSource("Path Here")
bottom_frame_clip = ImageSource("Path Here")

# Resize bottom clip
resize_width = top_frame_clip.width()
bottom_frame_aspect = float(bottom_frame_clip.width()) / bottom_frame_clip.height()
bottom_frame_height = int(resize_width / bottom_frame_aspect)
bottom_frame_clip = bottom_frame_clip.BilinearResize(resize_width, bottom_frame_height)

# Stack Right Pane Clips Vertically
right_frame_clip = StackVertical(top_frame_clip, bottom_frame_clip)

# Resize right pane clip
resize_height = left_frame_clip.height()
right_frame_aspect = float(right_frame_clip.width()) / right_frame_clip.height()
right_frame_width = int(resize_height * right_frame_aspect)
right_frame_clip = right_frame_clip.BilinearResize(right_frame_width, resize_height)

# Stack Clips Horizontally
final_frame_clip = StackHorizontal(left_frame_clip, right_frame_clip)

# Label text
final_frame_clip.Subtitle("Left Frame", x=3, y=3).\
Subtitle("Top Frame", x=left_frame_clip.width()+3, y=0).\
Subtitle("Bottom Frame", x=left_frame_clip.width()+3, y=left_frame_clip.height()-17)
