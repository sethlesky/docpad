---
mergedLayoutTest: true
tags: ['attr']
---

# Document
text '=====================================================\n'
text @content.replace(/\\n/g,'\n')
text '=====================================================\n'

# Layout
text '=====================================================\n'

# Fetch data
attrs = @documentModel.getAttributes()

# Delete environment specific variables
# timezone makes the dates impossible
# path differences make them impossible
# data is too much output
delete attrs.ctime
delete attrs.mtime
delete attrs.date
delete attrs.fullPath
delete attrs.fullDirPath
delete attrs.outPath
delete attrs.outDirPath
delete attrs.data
delete attrs.id
delete attrs.layoutId

# Sort the attributes
keys = []
keys.push(key)  for own key,value of attrs
keys.sort()
sortedAttrs = {}
for key in keys
	sortedAttrs[key] = attrs[key]

# Output data
text JSON.stringify(sortedAttrs,null,'\t')

text '=====================================================\n'