/*
Not really a bookmarklet. Run from console within devtools.
Used to extract and save the custom background blob added to SuperBookmarkDeskop
*/

const bg = getComputedStyle(document.getElementById("desktopBackground")).backgroundImage;
const blobUrl = bg.match(/url\("?(blob:[^")]+)"?\)/)[1];
console.log(blobUrl);

fetch(blobUrl)
  .then(r => r.blob())
  .then(blob => {
    const a = document.createElement("a");
    a.href = URL.createObjectURL(blob);
    a.download = "background";
    a.click();
  })
  .catch(console.error);



