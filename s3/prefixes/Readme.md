
### Create our bucket
```sh
aws s3 mb s3://prefixes-fun-bosco
```

## Create our folder
```sh
aws s3api put-object --bucket="prefixes-fun-bosco" --key="hello/"
```

## Create many folders
```sh
aws s3api put-object --bucket="prefixes-fun-bosco" --key="apple/banana/cherry/date/elderberry/fig/grape/honeydew/kiwi/lemon/mango/nectarine/orange/papaya/quince/raspberry/strawberry/tangerine/ugli/vanilla/watermelon/xigua/yam/zucchini/apricot/blackberry/cantaloupe/dragonfruit/eggplant/guava/huckleberry/jackfruit/kumquat/lime/melon/nut/olive/peach/plum/pear/quince/raspberry/starfruit/tangerine/ugli/vanilla/watermelon/xigua/yam/zucchini/apple/banana/cherry/date/elderberry/fig/grape/honeydew/kiwi/lemon/mango/nectarine/orange/papaya/quince/raspberry/strawberry/tangerine/ugli/vanilla/watermelon/xigua/yam/zucchini/apricot/blackberry/cantaloupe/dragonfruit/eggplant/guava/huckleberry/jackfruit/kumquat/lime/melon/nut/olive/peach/plum/pear/quince/raspberry/starfruit/tangerine/ugli/vanilla/watermelon/xigua/yam/zucchini/apple/banana/cherry/date/elderberry/fig/grape/honeydew/kiwi/lemon/mango/nectarine/orange/papaya/quince/raspberry/strawberry/tangerine/ugli/vanilla/watermelon/xigua/yam/zucchini/apricot/orange/papaya/quince/raspberry/strawberry/tangerine/ugli/vanilla/watermelon"
```

## Try and break the 1024 limit
```sh
aws s3api put-object --bucket="prefixes-fun-bosco" --key="apple/banana/cherry/date/elderberry/fig/grape/honeydew/kiwi/lemon/mango/nectarine/orange/papaya/quince/raspberry/strawberry/tangerine/ugli/vanilla/watermelon/xigua/yam/zucchini/apricot/blackberry/cantaloupe/dragonfruit/eggplant/guava/huckleberry/jackfruit/kumquat/lime/melon/nut/olive/peach/plum/pear/quince/raspberry/starfruit/tangerine/ugli/vanilla/watermelon/xigua/yam/zucchini/apple/banana/cherry/date/elderberry/fig/grape/honeydew/kiwi/lemon/mango/nectarine/orange/papaya/quince/raspberry/strawberry/tangerine/ugli/vanilla/watermelon/xigua/yam/zucchini/apricot/blackberry/cantaloupe/dragonfruit/eggplant/guava/huckleberry/jackfruit/kumquat/lime/melon/nut/olive/peach/plum/pear/quince/raspberry/starfruit/tangerine/ugli/vanilla/watermelon/xigua/yam/zucchini/apple/banana/cherry/date/elderberry/fig/grape/honeydew/kiwi/lemon/mango/nectarine/orange/papaya/quince/raspberry/strawberry/tangerine/ugli/vanilla/watermelon/xigua/yam/zucchini/apricot/orange/papaya/quince/raspberry/strawberry/tangerine/ugli/vanilla/watermelon/hello.txt" --body="hello.txt"
```