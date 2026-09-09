
> https://chatgpt.com/uc/6aa07423-c530-83ea-a155-83ce0ebb99f7



<details><summary> URLs </summary>

```
https://chatgpt.com/s/t_6aa0d35875ec8191b214154873594214
https://chatgpt.com/s/t_6aa0d396fb8c819199f2d38cb45f8136
https://chatgpt.com/s/t_6aa0d3ab7b588191a52fda9dd7ba3f38
https://chatgpt.com/s/t_6aa0d3bc4c648191914f2bc53eca611c
https://chatgpt.com/s/t_6aa0d3d010448191bcb0cb36cf7681ca
https://chatgpt.com/s/t_6aa0d3e4f2f88191a6663350cab93188
https://chatgpt.com/s/t_6aa0d3f819bc81919e61f634efad6b9f
https://chatgpt.com/s/t_6aa0d40907288191b5aafccad955fd77
https://chatgpt.com/s/t_6aa0d419b3fc819196b9690dc7636b12
```

https://chatgpt.com/s/t_6aa0d35875ec8191b214154873594214                                  
https://chatgpt.com/s/t_6aa0d396fb8c819199f2d38cb45f8136                                  
https://chatgpt.com/s/t_6aa0d3ab7b588191a52fda9dd7ba3f38                                  
https://chatgpt.com/s/t_6aa0d3bc4c648191914f2bc53eca611c                                  
https://chatgpt.com/s/t_6aa0d3d010448191bcb0cb36cf7681ca                                  
https://chatgpt.com/s/t_6aa0d3e4f2f88191a6663350cab93188                                  
https://chatgpt.com/s/t_6aa0d3f819bc81919e61f634efad6b9f                                  
https://chatgpt.com/s/t_6aa0d40907288191b5aafccad955fd77                                  
https://chatgpt.com/s/t_6aa0d419b3fc819196b9690dc7636b12                                  



</details>


***






```
How can I use ubo watch attribute with this:
example.com##body:watch-attr(class):remove-class(ads-visible)

Regarding this:
All have the class _18U6FUWZ
Those are all thumbnails. Then next level below is
"--delay:0s; --amplitude:9px;"

When you scroll by it then adds the class 
_1BZda1Zw

When it's done shaking then it's removed until to move by it again
```



<details><summary> Response </summary>

***

  
`https://chatgpt.com/s/t_6aa0d35875ec8191b214154873594214` | https://chatgpt.com/s/t_6aa0d35875ec8191b214154873594214

***




Yes — `:watch-attr(class)` is the right mechanism for this. It tells uBO to re-evaluate the filter whenever the element's `class` attribute changes.  GitHub

 From your description, the DOM is roughly:

```
<div class="_18U6FUWZ">
    ...
    <div style="--delay:0s; --amplitude:9px;" class="_1BZda1Zw">
        ...
    </div>
</div>
```

 and `_1BZda1Zw` is **temporarily added to the thumbnail when you scroll over/near it**, then removed after the shaking animation finishes.

 ### If you want to remove `_1BZda1Zw` immediately

 Try:

```
example.com##._18U6FUWZ ._1BZda1Zw:watch-attr(class):remove-class(_1BZda1Zw)
```

 However, there's an important detail: **`watch-attr()` watches the element it is attached to**. So if `_1BZda1Zw` doesn't exist until the site adds it, the above may not catch the addition in the way you expect.

 A better approach is to put `:watch-attr(class)` on the **thumbnail itself**, then target the class conditionally:

```
example.com##._18U6FUWZ:watch-attr(class):matches-attr(class="/(?:^|\s)_1BZda1Zw(?:\s|$)/"):remove-class(_1BZda1Zw)
```

 But there's an even simpler form if the thumbnail's class becomes:

```
_18U6FUWZ _1BZda1Zw
```

 You can use:

```
example.com##._18U6FUWZ._1BZda1Zw:watch-attr(class):remove-class(_1BZda1Zw)
```

 ### The catch

 `remove-class()` is an **action operator** and must be the final operator.  GitHub

 So this:

```
._18U6FUWZ._1BZda1Zw:watch-attr(class):remove-class(_1BZda1Zw)
```

 is syntactically appropriate.

 The key question is **where `_1BZda1Zw` gets added**.

 If the actual HTML is something like:

```
<div class="_18U6FUWZ">
```

 then, after scrolling:

```
<div class="_18U6FUWZ _1BZda1Zw">
```

 then I would start with:

```
example.com##._18U6FUWZ._1BZda1Zw:watch-attr(class):remove-class(_1BZda1Zw)
```

 uBO specifically documents `:watch-attr(class)` for cases where a class is dynamically added/removed without a DOM insertion/removal.  GitHub

 **If you paste the actual HTML for one `_18U6FUWZ` thumbnail both before and while `_1BZda1Zw` is present**, I can give you the exact uBO filter.

  [Sources](https://github.com/gorhill/ublock/wiki/Procedural-cosmetic-filters)


`https://github.com/gorhill/ublock/wiki/Procedural-cosmetic-filters`


<br>

</details>



<br>




<br>



<br>





















































> It's added to the style. Like it had in the beginning, but it's added to the front if that matters



<details><summary> Response </summary>

***

`https://chatgpt.com/s/t_6aa0d396fb8c819199f2d38cb45f8136` | https://chatgpt.com/s/t_6aa0d396fb8c819199f2d38cb45f8136

***

Ah, yes — **that changes things**. If `_1BZda1Zw` is a class added to the element's `class` attribute, but the `--delay:0s; --amplitude:9px;` is in the `style` attribute, then you need to watch **`style`**, not `class`.

 For example, if the thumbnail initially has:

```
<div class="_18U6FUWZ" style="--delay:0s; --amplitude:9px;">
```

 and when you scroll over it becomes:

```
<div class="_18U6FUWZ _1BZda1Zw" style="--delay:0s; --amplitude:9px;">
```

 then `_1BZda1Zw` being added to the **front of the class list doesn't matter** for a class selector.

 But if what actually changes is the inline style, e.g.:

```
style="transform: ...; --delay:0s; --amplitude:9px;"
```

 then `:watch-attr(style)` is what you want.

 ### If your goal is to disable the shaking

 If `_1BZda1Zw` is the class responsible for the animation, I'd actually try:

```
example.com##._18U6FUWZ._1BZda1Zw:remove-class(_1BZda1Zw)
```

 If uBO needs to react to the dynamically changing attribute, then:

```
example.com##._18U6FUWZ:watch-attr(class):remove-class(_1BZda1Zw)
```

 The latter tells uBO to watch the thumbnail's `class` attribute and remove `_1BZda1Zw` when the attribute changes.

 **You don't need to care whether the class is added at the front or back** — CSS class matching is order-independent.

 If you show me the **exact `class="..."` and `style="..."` before and during the shake**, I can tell you which `watch-attr()` version will actually work.







<br>
</details>



<br>



<br>





<br>













































> Everything is static, both the style and the tumbnail class above, it's only the class gets added to the style, it shakes, and then goes awawy until triggered again


<details><summary> Response </summary>

***

`https://chatgpt.com/s/t_6aa0d3ab7b588191a52fda9dd7ba3f38` | https://chatgpt.com/s/t_6aa0d3ab7b588191a52fda9dd7ba3f38

***

Got it. So the **thumbnail element itself stays the same**, including its existing class and inline `style`, and the site dynamically adds/removes a class that triggers the shake.

 For example:

```
<div class="_18U6FUWZ" style="--delay:0s; --amplitude:9px;">
```

 Then during the shake:

```
<div class="_18U6FUWZ _1BZda1Zw" style="--delay:0s; --amplitude:9px;">
```

 Then it returns to:

```
<div class="_18U6FUWZ" style="--delay:0s; --amplitude:9px;">
```

 In that case, **watch `class`**.

 Try:

```
example.com##._18U6FUWZ:watch-attr(class):remove-class(_1BZda1Zw)
```

 The fact that `_1BZda1Zw` gets inserted at the **front** doesn't matter.

 ### But there's a potential problem

 Your original example:

```
example.com##body:watch-attr(class):remove-class(ads-visible)
```

 watches the `class` attribute of **`body`**.

 For your case, you want to watch the `class` attribute of each thumbnail:

```
example.com##._18U6FUWZ:watch-attr(class):remove-class(_1BZda1Zw)
```

 So conceptually:

```
thumbnail
   ↓
watch its class attribute
   ↓
_1BZda1Zw appears
   ↓
uBO reacts
   ↓
remove _1BZda1Zw
```

 You don't need `:matches-attr()` or anything involving the inline `style`.

 **One caveat:** if `_1BZda1Zw` is actually being added to a _different element_ nested inside the `_18U6FUWZ` thumbnail, then the filter needs to watch that different element instead. If you give me the DOM snippet showing the `_18U6FUWZ` element and where `_1BZda1Zw` appears during the shake, I can make the exact selector.



<br>
</details>



<br>


<br>





<br>

















































```
No.
<div class="_...">
  <div style="...">
it's below it one level
```



<details><summary> Response </summary>

***

`https://chatgpt.com/s/t_6aa0d3bc4c648191914f2bc53eca611c` | https://chatgpt.com/s/t_6aa0d3bc4c648191914f2bc53eca611c

***


Ah, understood now. The structure is:

```
<div class="_18U6FUWZ">
    <div style="--delay:0s; --amplitude:9px;">
        ...
    </div>
</div>
```

 The **outer thumbnail** has the static `_18U6FUWZ` class.

 The **inner `<div>`** has the static inline style, and **that inner div** gets `_1BZda1Zw` added to its `class` attribute when the shake is triggered:

```
<div class="_18U6FUWZ">
    <div class="_1BZda1Zw" style="--delay:0s; --amplitude:9px;">
```

 and afterward:

```
<div class="_18U6FUWZ">
    <div style="--delay:0s; --amplitude:9px;">
```

 In that case, you want to watch the **inner div's `class` attribute**.

 I'd use:

```
example.com##._18U6FUWZ > div:watch-attr(class):remove-class(_1BZda1Zw)
```

 The `>` is important here because you said it's **exactly one level below** the thumbnail.

 If there are other direct-child divs and you need to identify this one specifically by its style, you can make it more restrictive:

```
example.com##._18U6FUWZ > div[style*="--amplitude:9px"]:watch-attr(class):remove-class(_1BZda1Zw)
```

 So the mechanism is:

```
._18U6FUWZ
    └── > div                 ← watch THIS element
          class changes
          ↓
          _1BZda1Zw appears
          ↓
          :remove-class(_1BZda1Zw)
```

 **And yes, the fact that `_1BZda1Zw` is inserted at the front of the class attribute is irrelevant.** CSS class matching doesn't care about class order.




<br>
</details>



<br>



<br>





<br>
































> Is that what greater than? means next level down?




<details><summary> Response </summary>

***

`https://chatgpt.com/s/t_6aa0d3d010448191bcb0cb36cf7681ca` | https://chatgpt.com/s/t_6aa0d3d010448191bcb0cb36cf7681ca

***


Exactly. In CSS, `>` means **“direct child”**.

 So:

```
._18U6FUWZ > div
```

 means:

```
._18U6FUWZ
└── div        ← exactly one level down
```

 Whereas:

```
._18U6FUWZ div
```

 means **any descendant**, regardless of how many levels down:

```
._18U6FUWZ
├── div
│   └── div
│       └── div   ← all can match
```

 So for the structure you described:

```
<div class="_18U6FUWZ">
    <div style="--delay:0s; --amplitude:9px;">
```

 this:

```
example.com##._18U6FUWZ > div:watch-attr(class):remove-class(_1BZda1Zw)
```

 targets that **immediate next-level `<div>`**.







<br>
</details>




<br>



<br>






<br>























> Nice. It worked. Wasn't sure if it needed a dot on the tail there, so I'm guessing dots are used similar to jq for linkage, and since it's already know to be there no need I presume.                        
> I also added matches-path to narrow it down further, and know it works cause I notice a smaller shaking thing next to it, but that I can remove the whole thing so no biggie to make a break point for that                 




<details><summary> Response </summary>

***

`https://chatgpt.com/s/t_6aa0d3e4f2f88191a6663350cab93188` | https://chatgpt.com/s/t_6aa0d3e4f2f88191a6663350cab93188

***

Yep — you've got the distinction right, with one small correction: **the dot isn't a linkage operator** in CSS/uBO. It's specifically the **class selector**.

 For example:

```
._18U6FUWZ
```

 means “an element having the class `_18U6FUWZ`.”

 And:

```
._18U6FUWZ > div
```

 means “a `div` that is a **direct child** of an element with `_18U6FUWZ`.”

 So you don't put a dot before `div` because `div` is an **HTML element selector**, not a class:

```
._18U6FUWZ > div
                    ↑
                 element
```

 If you had a class on that child, then you'd use the dot:

```
._18U6FUWZ > div._1BZda1Zw
                    ↑
                  class
```

 And your working filter:

```
example.com##._18U6FUWZ > div:watch-attr(class):remove-class(_1BZda1Zw)
```

 is basically saying:

 > Find this thumbnail → go exactly one level down → watch that child's class attribute → whenever it changes, remove `_1BZda1Zw`.

 Your `matches-path` addition makes sense too. And the fact that you're seeing that **smaller adjacent shake** is actually useful confirmation that you've isolated the correct animation rather than accidentally disabling some unrelated behavior. 😄

 And yeah, if that secondary thing can simply be removed entirely, that's probably the cleaner breakpoint rather than trying to suppress its animation separately.






<br>
</details>




<br>



<br>





<br>






















> I meant how on the end :remove-class(_1BZda1Zw) there's no dot, but  you normally need one when doing upward() which is why I was wonder if it's because the > is there so it knows




<details><summary> Response </summary>

***

`https://chatgpt.com/s/t_6aa0d3f819bc81919e61f634efad6b9f` | https://chatgpt.com/s/t_6aa0d3f819bc81919e61f634efad6b9f

***

Ahh, yes — **now I understand what you meant.** And no, the `>` isn't the reason.

 The key is that **`:remove-class(...)` takes a class name as an argument**, rather than being a CSS selector.

 So:

```
:remove-class(_1BZda1Zw)
```

 means:

 > Remove the class named `_1BZda1Zw`.

 You **don't** write the CSS class selector syntax there, so no `.`.

 Compare:

```
._1BZda1Zw
```

 means:

 > Select an element **having** the class `_1BZda1Zw`.

 While:

```
:remove-class(_1BZda1Zw)
```

 means:

 > Remove the class whose name is `_1BZda1Zw` from the element.

 ### Why `upward()` is different

 `upward()` takes a **CSS selector** as its argument, so you need the `.` when you're specifying a class:

```
:upward(._18U6FUWZ)
```

 That's equivalent to saying:

 > Go upward until you find an element matching the CSS selector `._18U6FUWZ`.

 Whereas:

```
:remove-class(_1BZda1Zw)
```

 isn't asking uBO to _find_ something. It's being given the **literal class name** to remove.

 So these are all correct:

```
._18U6FUWZ
:upward(._18U6FUWZ)
:remove-class(_1BZda1Zw)
```

 The first two use **CSS selectors** → `.` needed for a class.

 The last one uses a **class name argument** → no `.`.

 And `>` is completely independent of that. It only controls the relationship between the selectors:

```
._18U6FUWZ > div
```

 = “a `div` that is a direct child of `._18U6FUWZ`.”





<br>
</details>



<br>











<br>






<br>
















```
I said screw it and set a break point, but this one is different where it has a class and style with delay only, but when it's modified to add the shake it becomes a dual class
"_2mk8qHEG" will become "_2mk8qHEG _1BZda1Zw"
I want to say it's inserting the same class I guess, so I wonder if I can block it globally to avoid insetion elsewhere
```


<details><summary> Response </summary>

***

`https://chatgpt.com/s/t_6aa0d40907288191b5aafccad955fd77` | https://chatgpt.com/s/t_6aa0d40907288191b5aafccad955fd77

***

Yes. If `_1BZda1Zw` is **the same shake class** being dynamically added in multiple places, you can target the class globally instead of handling each thumbnail separately.

 For example:

```
example.com##._1BZda1Zw:remove-class(_1BZda1Zw)
```

 But there's an important uBO detail: that selector initially matches elements that **already have** `_1BZda1Zw`; it doesn't necessarily mean “prevent this class from ever being inserted.” To catch dynamically added instances, use `:watch-attr(class)` on the relevant elements.

 If you want to broadly catch elements where the class gets added:

```
example.com##*:watch-attr(class):remove-class(_1BZda1Zw)
```

 That essentially says:

 > Watch every element's `class` attribute, and whenever it changes, remove `_1BZda1Zw`.

 ### However, I'd be cautious with the global version

 If `_1BZda1Zw` is used **only** for this shake animation across the site, then:

```
example.com##*:watch-attr(class):remove-class(_1BZda1Zw)
```

 is a nice "kill it with fire" solution.

 If the site uses `_1BZda1Zw` for other purposes too, your more targeted version is safer:

```
example.com##._2mk8qHEG:watch-attr(class):remove-class(_1BZda1Zw)
```

 That catches:

```
_2mk8qHEG
      ↓
_2mk8qHEG _1BZda1Zw
      ↓
_2mk8qHEG
```

 without touching unrelated elements.

 And yes, your observation is correct: it's not replacing `_2mk8qHEG`; it's **adding `_1BZda1Zw` as a second class**, then removing it afterward.

 If you've confirmed `_1BZda1Zw` is _exclusively_ the shake class, I'd personally try the global rule. It's much cleaner than chasing every component that happens to use the animation.



<br>
</details>


<br>









<br>

<br>





































> I might, but it's probably just those two, but man has that been annoying me for a while, so I literally dump it then look at it from the page with JS


<details><summary> Response </summary>

***

`https://chatgpt.com/s/t_6aa0d419b3fc819196b9690dc7636b12` | https://chatgpt.com/s/t_6aa0d419b3fc819196b9690dc7636b12

***


😂 Honestly, that's a pretty reasonable way to attack these sites.

 Especially with obfuscated/generated class names, trying to reason from the rendered page alone can be maddening. Your workflow of:

 1. Find the thing that annoys you.
2. Inspect the DOM while it's happening.
3. Identify what changes between **normal → triggered → normal**.
4. Kill the specific mutation with uBO.
5. Use JS when you need to verify what's actually happening.

 …is basically the right approach.

 And the nice thing about what you just discovered is that `_1BZda1Zw` gives you a **stable behavioral hook** even though `_2mk8qHEG` and `_18U6FUWZ` are probably generated garbage.

 If you see:

```
_2mk8qHEG
```

 →

```
_2mk8qHEG _1BZda1Zw
```

 →

```
_2mk8qHEG
```

 then you've found the site's **state transition**, rather than merely its visual implementation. That's usually the much better thing to target.

 And your JS inspection trick is particularly useful for this. Something as simple as watching mutations can make these things obvious:

```
new MutationObserver(mutations => {
    for (const m of mutations) {
        if (m.type === 'attributes') {
            console.log(m.target, m.attributeName);
        }
    }
}).observe(document.body, {
    subtree: true,
    attributes: true
});
```

 Then trigger the annoying behavior and watch exactly which element and attribute changes.

 Once you know **"this class gets added here"**, uBO's `:watch-attr(class)` becomes a really clean way of saying _nope_. 😄


<br>
</details>













