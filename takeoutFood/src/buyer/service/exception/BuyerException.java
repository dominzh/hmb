package buyer.service.exception;
/**
 * NullPointerException 用户业务异常
 * @author bx
 *
 */
public class BuyerException extends Exception {

	public BuyerException() {
		super();
	}

	public BuyerException(String message, Throwable cause) {
		super(message, cause);
	}

	public BuyerException(String message) {
		super(message);
	}

	public BuyerException(Throwable cause) {
		super(cause);
	}
}
