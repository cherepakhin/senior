Статья https://dzone.com/articles/kotlin-code-style-best-practices-for-former-java-d
TODO: Сохранить в шпаргалки и дополнить своим
Kotlin Code Style: Best Practices for Former Java Developers
Many Kotlin projects mirror Java thinking—code that works but lacks Kotlin’s true strengths of conciseness, expressiveness, and safety, creating “Java with a Kotlin accent.”
By Konstantin Glumov user avatar Konstantin Glumov · Jan. 12, 26 · Tutorial
 Likes (3)
 Comment
 Save
 Tweet
 Share
 2.2K Views
Join the DZone community and get the full member experience. Join For Free
Many Kotlin codebases are written by developers with a Java background. The syntax is Kotlin, but the mindset is often still Java, resulting in what can be called "Java with a Kotlin accent." This style compiles and runs, but it misses the core advantages of Kotlin: conciseness, expressiveness, and safety.

Common symptoms include:

Verbose if (x != null) blocks instead of safe calls and the Elvis operator.
Loops and temporary collections in place of filter and map.
if/else if chains instead of powerful when expressions.
Overuse of var and utility classes where val and extension functions are better.
The issue isn't a lack of effort; it's the absence of a shared understanding of idiomatic Kotlin. This article provides a clear, actionable code style guide to bridge the gap between Java and Kotlin. We'll move beyond basic syntax to focus on the paradigm shift needed to write clean, professional, and truly idiomatic Kotlin.

Multiple Data Classes In One File
Java-style (Before)
Kotlin
// UserRequest.kt

data class UserRequest(val name: String, val email: String)

// UserResponse.kt

data class UserResponse(val id: Long, val name: String)

// UserError.kt

data class UserError(val code: String, val message: String)
Kotlin-style (After)
Kotlin
// UserModels.kt

data class UserRequest(val name: String, val email: String)

data class UserResponse(val id: Long, val name: String)

data class UserError(val code: String, val message: String)
Constants in Companion Object at the End of Class
Java-style (Before)
Java
public class Config {
    public static final String API_ENDPOINT = "https://api.example.com";
}
Kotlin-style (After)
Kotlin
class NegativeFeedbackDialogFragment {
    /*.. business logic ..*/

    private companion object : KLogging() {
        const val API_ENDPOINT = "https://api.example.com"
    }
}
Expression Body for Functions
Java-style (Before)
Kotlin
fun calculateDiscount(price: Double, discountPercent: Int): Double {
    return price * (1 - discountPercent / 100.0)
}
fun isAdult(age: Int): Boolean {
    return age >= 18
}
fun getUserFullName(user: User): String {
    return "${user.firstName} ${user.lastName}"
}
Kotlin-style (After)
Kotlin
fun calculateDiscount(price: Double, discountPercent: Int): Double =
    price * (1 - discountPercent / 100.0)

fun isAdult(age: Int): Boolean = age >= 18

fun getUserFullName(user: User): String =
    "${user.firstName} ${user.lastName}"
Elvis Operator Instead of if-null Checks
Java-style (Before)
Kotlin
fun getUsername(user: User?): String {
    if (user != null) {
        if (user.name != null) {
            return user.name
        } else {
            return "Guest"
        }
    } else {
        return "Guest"
    }
}

fun calculateTotal(price: Double?): Double {
    val finalPrice: Double
    if (price != null) {
        finalPrice = price
    } else {
        finalPrice = 0.0
    }
    return finalPrice
}
Kotlin-style (After)
Kotlin
fun getUsername(user: User?): String =
    user?.name ?: "Guest"

fun calculateTotal(price: Double?): Double =
    price ?: 0.0
Using In Lambdas
Java-style (Before)
Kotlin
users.filter { user -> user.isActive }
    .map { user -> user.email }
    .forEach { email -> println(email) }

val names = users
    .filter { user -> user.age >= 18 }
    .map { user -> user.name }
Kotlin-style (After)
Kotlin
users.filter { it.isActive }
    .map { it.email }
    .forEach { println(it) }

val names = users
    .filter { it.age >= 18 }
    .map { it.name }
Note: Use named parameters if the lambda is complex or nested.

when Instead of Multiple if-else
Java-style (Before)
Kotlin
fun getStatusMessage(status: OrderStatus): String {
    if (status == OrderStatus.PENDING) {
        return "Order is being processed"
    } else if (status == OrderStatus.SHIPPED) {
        return "Order has been shipped"
    } else if (status == OrderStatus.DELIVERED) {
        return "Order delivered"
    } else if (status == OrderStatus.CANCELLED) {
        return "Order cancelled"
    } else {
        return "Unknown status"
    }
}

fun calculateFee(userType: String): Double {
    if (userType == "premium") {
        return 0.0
    } else if (userType == "standard") {
        return 5.0
    } else {
        return 10.0
    }
}
Kotlin-style (After)
Kotlin
fun getStatusMessage(status: OrderStatus): String = when (status) {
    OrderStatus.PENDING -> "Order is being processed"
    OrderStatus.SHIPPED -> "Order has been shipped"
    OrderStatus.DELIVERED -> "Order delivered"
    OrderStatus.CANCELLED -> "Order cancelled"
    else -> "Unknown status"
}

fun calculateFee(userType: String): Double = when (userType) {
    "premium" -> 0.0
    "standard" -> 5.0
    else -> 10.0
}
in Instead of contains In Collections
Java-style (Before)
Kotlin
fun isValidStatus(status: String): Boolean {
    val validStatuses = listOf("active", "pending", "completed")
    return validStatuses.contains(status)
}

fun hasPermission(role: String): Boolean {
    val adminRoles = setOf("admin", "superadmin", "moderator")
    return adminRoles.contains(role)
}

if (allowedIds.contains(userId)) {
    // logic
}
Kotlin-style (After)
Kotlin
fun isValidStatus(status: String): Boolean {
    val validStatuses = listOf("active", "pending", "completed")
    return status in validStatuses
}

fun hasPermission(role: String): Boolean {
    val adminRoles = setOf("admin", "superadmin", "moderator")
    return role in adminRoles
}

if (userId in allowedIds) {
    // logic
}
Avoid Stream API
Java-style (Before)
Kotlin
val activeUsers = users.stream()
    .filter { it.isActive }
    .collect(Collectors.toList())

val userEmails = users.stream()
    .map { it.email }
    .collect(Collectors.toSet())

val totalAmount = orders.stream()
    .mapToDouble { it.amount }
    .sum()

val hasAdult = users.stream()
    .anyMatch { it.age >= 18 }
Kotlin-style (After)
Kotlin
val activeUsers = users.filter { it.isActive }

val userEmails = users.map { it.email }.toSet()

val totalAmount = orders.sumOf { it.amount }

val hasAdult = users.any { it.age >= 18 }
let, run, with for Functional Style
Java-style (Before)
Kotlin
fun processUser(user: User?) {
    if (user != null) {
        validateUser(user)
        saveUser(user)
        notifyUser(user)
    }
}

fun createReport(data: ReportData?): Report? {
    if (data != null) {
        val report = Report()
        report.title = data.title
        report.content = data.content
        report.timestamp = System.currentTimeMillis()
        return report
    }
    return null
}

val config = Config()
config.host = "localhost"
config.port = 8080
config.timeout = 30
Kotlin-style (After)
Kotlin
fun processUser(user: User?) {
    user?.let {
        validateUser(it)
        saveUser(it)
        notifyUser(it)
    }
}

fun createReport(data: ReportData?): Report? =
    data?.let {
        Report().apply {
            title = it.title
            content = it.content
            timestamp = System.currentTimeMillis()
        }
    }

val config = Config().apply {
    host = "localhost"
    port = 8080
    timeout = 30
}
Prefer Immutable Collections
Java-style (Before)
Kotlin
fun getActiveUsers(users: List<User>): MutableList<User> {
    val result = mutableListOf<User>()
    for (user in users) {
        if (user.isActive) {
            result.add(user)
        }
    }
    return result
}

class UserRepository {
    private val users: MutableList<User> = mutableListOf()

    fun getUsers(): MutableList<User> = users
}

val numbers = mutableListOf(1, 2, 3, 4, 5)
val names = mutableSetOf("Alice", "Bob", "Charlie")
Kotlin-style (After)
Kotlin
fun getActiveUsers(users: List<User>): List<User> =
    users.filter { it.isActive }

class UserRepository {
    private val _users: MutableList<User> = mutableListOf()
    val users: List<User> get() = _users.toList()
}

val numbers = listOf(1, 2, 3, 4, 5)
val names = setOf("Alice", "Bob", "Charlie")
val instead of var
Java-style (Before)
Kotlin
fun calculateTotal(items: List<Item>): Double {
    var total = 0.0
    for (item in items) {
        total += item.price
    }
    return total
}

fun findUser(id: Long): User? {
    var result: User? = null
    for (user in users) {
        if (user.id == id) {
            result = user
            break
        }
    }
    return result
}

var message = "Hello"
message = message + " World"
Kotlin-style (After)
Kotlin
fun calculateTotal(items: List<Item>): Double =
    items.sumOf { it.price }

fun findUser(id: Long): User? =
    users.find { it.id == id }

val message = "Hello" + " World"
// or
val message = buildString {
    append("Hello")
    append(" World")
}
Smart Casts
Java-style (Before)
Kotlin
fun processValue(value: Any) {
    if (value is String) {
        val str = value as String
        println(str.uppercase())
    }
}

fun getLength(obj: Any): Int {
    if (obj is String) {
        return (obj as String).length
    } else if (obj is List<*>) {
        return (obj as List<*>).size
    }
    return 0
}

when (val data = getData()) {
    is Success -> {
        val result = data as Success
        processSuccess(result.value)
    }
    is Error -> {
        val error = data as Error
        handleError(error.message)
    }
}
Kotlin-style (After)
Kotlin
fun processValue(value: Any) {
    if (value is String) {
        println(value.uppercase()) // automatic cast
    }
}

fun getLength(obj: Any): Int = when (obj) {
    is String -> obj.length
    is List<*> -> obj.size
    else -> 0
}

when (val data = getData()) {
    is Success -> processSuccess(data.value)
    is Error -> handleError(data.message)
}
Extension Functions Instead of Utility Classes
Java-style (Before)
Kotlin
object StringUtils {
    fun isValidEmail(email: String): Boolean {
        return email.contains("@") && email.contains(".")
    }

    fun truncate(text: String, maxLength: Int): String {
        return if (text.length > maxLength) {
            text.substring(0, maxLength) + "..."
        } else {
            text
        }
    }
}

object DateUtils {
    fun formatDate(date: Date): String {
        val formatter = SimpleDateFormat("yyyy-MM-dd")
        return formatter.format(date)
    }
}

// Usage
val email = "test@example.com"
if (StringUtils.isValidEmail(email)) {
    // ...
}
val short = StringUtils.truncate(longText, 100)
Kotlin-style (After)
Kotlin
fun String.isValidEmail(): Boolean =
    contains("@") && contains(".")

fun String.truncate(maxLength: Int): String =
    if (length > maxLength) {
        substring(0, maxLength) + "..."
    } else {
        this
    }

fun Date.formatAsDate(): String =
    SimpleDateFormat("yyyy-MM-dd").format(this)

// Usage
val email = "test@example.com"
if (email.isValidEmail()) {
    // ...
}
val short = longText.truncate(100)
Use Instead of try-with-resources
Java-style (Before)
Kotlin
fun readFile(path: String): String {
    val reader = BufferedReader(FileReader(path))
    try {
        return reader.readText()
    } finally {
        reader.close()
    }
}

fun writeToFile(path: String, content: String) {
    val writer = BufferedWriter(FileWriter(path))
    try {
        writer.write(content)
    } finally {
        writer.close()
    }
}

fun copyFile(source: String, target: String) {
    val input = FileInputStream(source)
    try {
        val output = FileOutputStream(target)
        try {
            input.copyTo(output)
        } finally {
            output.close()
        }
    } finally {
        input.close()
    }
}
Kotlin-style (After)
Kotlin
fun readFile(path: String): String =
    BufferedReader(FileReader(path)).use { it.readText() }

fun writeToFile(path: String, content: String) {
    BufferedWriter(FileWriter(path)).use { it.write(content) }
}

fun copyFile(source: String, target: String) {
    FileInputStream(source).use { input ->
        FileOutputStream(target).use { output ->
            input.copyTo(output)
        }
    }
}

// Even better - use Kotlin's File API
fun readFile(path: String): String =
    File(path).readText()

fun writeToFile(path: String, content: String) {
    File(path).writeText(content)
}

fun copyFile(source: String, target: String) {
    File(source).copyTo(File(target))
}


Transitioning from Java to Kotlin requires unlearning old habits. Adopting all these best practices at once can be overwhelming. The most effective approach is to start small: focus on one or two patterns, like using val over var or replacing if/else with when, and apply them consistently.

Formalize this learning by creating a living Code Style Guide for your team. This investment ends debates, accelerates onboarding, and improves long-term maintainability.

Ultimately, writing idiomatic Kotlin is not about purity, but about creating code that is more readable, reliable, and enjoyable to maintain. Adopt these patterns, and you will start writing Kotlin that truly feels like Kotlin.

