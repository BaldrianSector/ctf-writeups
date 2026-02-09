# flag-irl

**Writeup by:** briatlon for [0-Day Aarhus](https://ctftime.org/team/251818/) · **Event:** [LA CTF 2026](https://ctftime.org/event/3015/) · **Solves:** 36 · **Challenge Author:** pstorm

## Challenge description

> With the generous help of the folks at 3D4E, I finally have a flag that can literally be captured! I made sure to [document this incredible accomplishment](https://www.youtube.com/watch?v=aKpsggYoVnc), though my microphone was busted.

*The following was added later…*

> This is **not** an OSINT challenge, and the video is the only thing you need to solve the challenge. Please do not try to research the challenge author or any other organizations mentioned in the description. It will not help.

## Solve

The challenge consisted of a video of a 3D printer that over 8 minutes printed a physical flag. The twist was that the print wasn’t visible from the camera angle. So the solve seemed pretty straightforward: track the movement of the 3D printer and reconstruct the print and see the flag. Well... easier said than done 😆

At first I wasn’t sure that it was even doable, so for good measure I checked the sound of the file and could confirm that it was dead silence. Also the description of the video said `sorry, no audio. mic's dead`, so no frequency analysis. 

I visited [3D4E's website](https://www.3d4e.com.tr/about.html), bit sus about the page, but that wasn’t going to give away the flag. I thought the print file might be leaked online somewhere, but I was too excited to get started with the 2d reconstruction. I saw the challenge had few solves, so realized it might be worth the effort.

I downloaded the video and ran some initial tracking in python.

<img width="800" alt="tracking_preview" src="https://github.com/user-attachments/assets/dcb828ac-af73-4872-9c79-31dde88c47e0" />

I marked the printer head and bed and got this image.

<img width="800" alt="tracked_toolpath_axisfit" src="https://github.com/user-attachments/assets/65e677b9-d41c-4174-98b0-8612896cb92f" />

Not great, but some signs that it could be doable. Looking deeper at the tracking I could tell that the bed frame wasn't sticking. I did some tweaks got some improvement.

<img width="800" alt="print_reconstruction_axis_test" src="https://github.com/user-attachments/assets/a92cce5d-4d9e-4d26-83a2-57af980740a2" />

First key realization was that the initial part of the print was the purge line. That gave me a starting point since I knew those coordinates had to be in the bottom left corner and also that it had to start with a straight line. The fundamental part of the challenge is understading that the head moves on the X-axis and the bed adjusts the Y-axis. Working with that gave me a base for further tweaks and after some further adjustments I got this:

<img width="800" alt="print_reconstruction_axis_smoketest3" src="https://github.com/user-attachments/assets/8ca5a18d-becb-4f94-b3f7-39bfa164d297" />

I started to doubt myself a little, but decided to keep trying. Problem was that whenever the printer would shift directions it introduced a big shake in the video that made the tracking hard and results very wobbly.

<img width="800" alt="Screenshot" src="https://github.com/user-attachments/assets/01d3401d-98ad-4d8b-9158-2f916d710996" />

I pulled the video into in Final Cut Pro (lonely mac user here 🫣) and stabilized it. There I was able to add trackers and suddenly a wild flag appeared.

<img width="800" alt="Flag" src="https://github.com/user-attachments/assets/71cfc3ad-85ce-45b7-ba79-666e6b332f8f" />

Not quite done, but good enough that it seemed reasonable to keep going. We started guessing for the flag in the team's Discord, but the text wasn't legible at this point. Next big realization was that I only needed to focus on the last 32 seconds that included the actual flag. By splitting the reconstruction into smaller parts I was able to see the progress over time:

<img width="800" alt="gif" src="https://github.com/user-attachments/assets/cf8cecf2-200d-4083-bf94-f46170d63a26" />

That suddenly made it a lot easier since I didn't have to do stabilization and tracking on the whole 8 minute video. I tried adding multiple tracking points and averaged the differences out to see if that would help with a better result. 

<img width="800" alt="overlay_union" src="https://github.com/user-attachments/assets/9c69e7f9-f700-452a-ae7a-74147853dcc8" />

Still no success. Smoothening up the video made the lines softer and it became harder to read the text. I won't bother you with all the itterations made...  

I had to go back to the original video and make it better. Key step was to slow the video down and interpolate the frames for a smoother result. I used Final Cut to bring the video down to 25% speed, added stabilization to remove shake and got much better tracking results in Apple Motion. I also started to experienment with hiding lines when the head was moving too fast. That got rid of bridging lines between letters. I was able to get this result which ultimately revealed the flag:

<img width="800" alt="print_autocrop_bw" src="https://github.com/user-attachments/assets/c6cca4d9-fbdd-4d8c-abac-f07648f3504c" />

In the end I was able to reconstruct this video from the original video, using the slowed down tracking (sped up again in this video for demo purposes). That shows the flag written from the tracking data synced up with the stabalized video:

<video width="800" src="https://github.com/user-attachments/assets/b1f7e181-1e79-4c4d-b092-274ce2eca863"></video>

## Final remarks

This is <ins>one of the most fun MISC challenges I've solved to date</ins>. It was a perfect mix of being hard, working with content that was just shaky enough that solving it took effort, but a simple enough idea that it was totally clear from the beginning what had to be done. I love that there was no decoy audio and that a note was added to avoid unnecessary research.

Huge shout out to author for an original idea that taught me something I didn't think was possible.

## Flag

`lactf{4n_irl_fla6_f0r_onc3}`

<img width="800" alt="actual flag" src="https://github.com/uclaacm/lactf-archive/blob/main/2026/misc/flag-irl/flag.jpg">
