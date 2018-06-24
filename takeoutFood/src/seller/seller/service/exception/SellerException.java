package seller.seller.service.exception;
/**
 * NullPointerException 用户业务异常
 * @author bx
 *
 */
public class SellerException extends Exception {

	public SellerException() {
		super();
	}

	public SellerException(String message, Throwable cause) {
		super(message, cause);
	}

	public SellerException(String message) {
		super(message);
	}

	public SellerException(Throwable cause) {
		super(cause);
	}
}
