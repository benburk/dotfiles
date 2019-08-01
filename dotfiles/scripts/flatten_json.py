def flatten_json(y, prefix=""):
    """flatten json/dict containing inner dicts and lists"""
    out = {}

    def flatten(x, name=""):
        if isinstance(x, dict):
            for a in x:
                flatten(x[a], name + a + "_")
        elif isinstance(x, list):
            i = 0
            for a in x:
                flatten(a, name + str(i) + "_")
                i += 1
        else:
            out[name[:-1]] = x

    flatten(y, prefix)
    return out
