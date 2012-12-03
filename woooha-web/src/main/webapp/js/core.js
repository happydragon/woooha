/**************************对String对象的扩展*********************************/
/**
 * 在字符串前拼接contextpath
 */
String.prototype.prependcontext = function() {
    if (typeof contextpath == "undefined") {
        throw new Error("global variable contextpath not found, maybe you not include common.ftl.");
    }
    var result = (this.startsWith("/") ? "" : "/") + this;
    return result.startsWith(contextpath) ? result: contextpath + result;
}

String.prototype.trim = function() {
    if (this == void 0) {throw new Error("Illegal argument error.");}
    return this.replace(/(^\s+)|(\s+$)/g, "");
}

String.prototype.trimIf = function(ifTrim) {
    if (this == void 0) {throw new Error("Illegal argument error.");}
    return ifTrim == true ? this.trim() : this.toString();
}

/**
 * 判断字符串是否为null or blank string
 */
String.prototype.isBlank = function() {
    if (this == void 0) {throw new Error("Illegal argument error.");}
    return this == null || this.trim().length == 0;
}

/**
 * 判断字符串是否以指定的字符串开始
 */
String.prototype.startsWith = function(str) {
    if (this == void 0) {throw new Error("Illegal argument error.");}
    return this.substr(0, str.length) == str;
}

String.prototype.toMap = function(sep1, sep2) {
    if (this == void 0) {throw new Error("Illegal argument error.");}
    var segments = this.split(sep1);
    var map = new Object();
    for (var i = 0; i < segments.length; i++) {
        if (!segments[i].isBlank()) {
            var index = segments[i].indexOf(sep2);
            if (index == -1) {
                throw new Error("The string is not map format.");
            }
            var key = segments[i].substr(0, index);
            var value = segments[i].substr(index + 1);
            map[key] = value;
        }
        }
    return map;
}