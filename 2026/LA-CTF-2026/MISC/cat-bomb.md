# cat bomb!

**Writeup by:** briatlon for [0-Day Aarhus](https://ctftime.org/team/251818/) · **Event:** [LA CTF 2026](https://ctftime.org/event/3015/) · **Solves:** 266 · **Challenge Author:** burturt

## Challenge description

> I took a photo while hiking in the woods of thousands of orange structures, but a cat's tail photo-bombed the shot. Find the exact spot using Google Street View and submit the coordinates from the URL as `lactf{LAT,LONG}`. The original prompt also gave an example using the Bruin Bear statue and a sample `lactf{34.0710103,-118.4449715}` answer format.
> <img width="800" alt="cat-bomb" src="https://github.com/user-attachments/assets/6fc1896a-5719-4a09-b969-cc25ce798424" />

## Solve

I had hoped for some geOSINT and when I saw this image it immediately gave me a huge smile on my face.

<img width="800" alt="reaction" src="https://github.com/user-attachments/assets/d3fa7395-5806-4d21-9c65-dbbd9377c258" />

I started with checking EXIF data, to make sure that nothing was included. Luckily nothing showed up. 

Around Japan there are lots of torii gates (often seen at Shinto shrines) that mark the boundary between the everyday world and a sacred space. In Kyoto at Fushimi Inari Taisha are around 10000 of these gates that have been donated as offerings each inscribed with the donor's name and date.

<img width="800" alt="map" src="https://github.com/user-attachments/assets/bc0bc2d9-87c4-4eec-890d-7c9454945ece" />

It's a very popular tourist spot with lots of people along the trail. I knew that the path starts on the foot of the mountain and the gates are very closely stacked there, but for the location on the image, the gates had some distance between them. That meant it had to be at least a bit up the hillside. 

To geolocate this I started with reverse image search that quickly gave me links to blogs where people have uploaded images from the location distinguishable from the glyphs on the beams. That gave me something to look for, when identifying the exact gates.

<img width="800" src="https://github.com/user-attachments/assets/1244ce03-604e-4165-8a5c-e91d2fbd7c4b" alt="20240625%EF%BC%BF003957" />

<img width="800" src="https://github.com/user-attachments/assets/e6b7530c-845e-4530-adaa-d6ef727ef4da" alt="2019-01-06_09 54 59" />

I also noticed the pole on the right of the image that gave a good marker to look for. One important detail is also that the gates only have their inscription on one side, meaning that I knew the bend of the road had to be slightly left, since the blog images confirmed that the image had not been flipped horizontally. I thought the bottom right had stairs, but in total I now felt like I had plenty of stuff to confirm the location once I actually found a good candidate.

I dropped down on Google Street View and trailed along the path. After some time I started noticing that the ground in some places, unlike the challenge picture, had tiles on the ground. That made it a lot easier to quietly disregard certain parts of the path, since I knew they were wrong if they had that.

<img width="800" alt="tiles" src="https://github.com/user-attachments/assets/05bad21b-d8b9-4280-8e43-f28660fad3f9" />

After some looking around it finally struck me. This was NOT an OSINT challenge. 

Atleast for me. I already had the exact location. This was closed source intelligence.

I scrolled through my phone and sure enough. Going far enough back I had actually taken a few images and a view of the exact location. I had brought a camera, but luckily enough for me, I'd also taken some images and a video with my phone, that had the exact geo data just a few meters away from the spot I was now looking for.

<video width="800" src="https://github.com/user-attachments/assets/3bc07440-bbd4-4af6-ace3-48d14c1fb435" controls>Video of the spot</video>

It's every geoguessing person's dream to drop down on a spot, and know exactly where it is. This time I had the images to prove it. And luckily for me they also had GPS coordinates stored.

<img width="800" src="https://github.com/user-attachments/assets/564501d7-7732-40d9-8ec6-456baa0cccd3" alt="Selfie time" />

<img width="800" src="https://github.com/user-attachments/assets/664c85b3-71f7-49dc-842c-a489757df0a0" alt="Location from the back" />

I confirmed the location and saw that it was not stairs, but a lamp on the right in the picture and that there was distinct lines in the ground that I hadn't paid attention to before. 

<img width="800" alt="location" src="https://github.com/user-attachments/assets/5cd38508-572e-46dd-9e9c-c9ae8c90c640" />

These are my notes for how to locate it, if I were to do it again without already having the GPS coordinates.

<img width="800" src="https://github.com/user-attachments/assets/ef513fdb-3829-46ad-97fd-e3aeb5c74515" alt="cat-bomb" />

## Final remarks

This was a solve method I probably won't get to do again for quite some time, but boy was it fun. Also a good reminder to be aware that you're automatically storing GPS data on every travel picture on your phone for better and for worse. This time I got lucky.

## Flag

`lactf{34.9681588,135.7772502}`
